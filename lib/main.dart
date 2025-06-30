import 'package:flutter/material.dart';
import 'package:stripe_payment/routes.dart';

void main() {
  AppRouter.setupRoutes(); // Setup Fluro
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stripe Payment',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.home,
      routes: routes,
      onGenerateRoute: AppRouter.router.generator,
    );
  }
}
