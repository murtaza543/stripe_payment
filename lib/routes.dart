import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:stripe_payment/views/home/home_screen.dart';

/// Route map for MaterialApp
final Map<String, WidgetBuilder> routes = {
  '/home': (context) => const HomeScreen(),
};

/// Fluro routing
class AppRouter {
  AppRouter._(); // private constructor

  static final FluroRouter router = FluroRouter();

  // Route path
  static const String home = '/home';

  // Handler for Fluro
  static final Handler _homeHandler =
  Handler(handlerFunc: (context, params) => const HomeScreen());

  // Setup Fluro routes
  static void setupRoutes() {
    router.define(
      home,
      handler: _homeHandler,
      transitionType: TransitionType.inFromLeft,
    );
  }
}
