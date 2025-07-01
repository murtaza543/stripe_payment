import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeProvider extends ChangeNotifier {
  String amount = '';
  String currency = 'usd';

  Map<String, dynamic>? paymentIntent;

  void setAmount(String value) {
    amount = value;
    notifyListeners();
  }

  void setCurrency(String value) {
    currency = value;
    notifyListeners();
  }

  Future<void> pay(BuildContext context) async {
    try {
      final amountInCents = ((double.tryParse(amount) ?? 0) * 100).toInt();
      if (amountInCents <= 0) throw Exception('Invalid amount');

      print('Creating PaymentIntent for: $amountInCents $currency');
      paymentIntent = await _createPaymentIntent(amountInCents.toString(), currency);

      final clientSecret = paymentIntent?['client_secret'];
      if (clientSecret == null) throw Exception('Missing client_secret');


      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Stripe Test',
          style: ThemeMode.light,
        ),
      );

      print('Payment sheet initialized');

      await Stripe.instance.presentPaymentSheet();

      print('Payment sheet presented');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Payment successful!')),
      );

      paymentIntent = null;

    } on StripeException catch (e) {
      print('StripeException: ${e.error.localizedMessage}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Stripe error: ${e.error.localizedMessage}')),
      );
    } catch (e) {
      print('General error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment failed: $e')),
      );
    }
  }

  Future<Map<String, dynamic>> _createPaymentIntent(String amount, String currency) async {
    try {
      final body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card',
       // 'setup_future_usage': 'off_session',
        'setup_future_usage': PaymentIntentsFutureUsage.OffSession,
      };

      final response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
      'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET_KEY']

      }',

          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );

      final decoded = json.decode(response.body);
      if (decoded['error'] != null) {
        throw Exception('Stripe error: ${decoded['error']['message']}');
      }

      return decoded;
    } catch (err) {
      throw Exception('Failed to create PaymentIntent: $err');
    }
  }
}
