

// app_routes.dart
import 'package:flutter/material.dart';
import 'package:stripe_payment/views/home/home_screen.dart';


class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    RouteLinks.homeScreen: (_) => const HomeScreen(),
    // Add more route entries here
  };
}

class RouteLinks {
  static const String homeScreen = '/home';
  static const String loginScreen = '/login';
  static const String signupScreen = '/signup';
  static const String forgotPasswordScreen = '/forgot_password';
// Add more route names as needed
}
