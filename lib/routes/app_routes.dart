import 'package:flutter/material.dart';
import '../views/app/initialScreen.dart';
import '../views/register/register_screen.dart'; // Importe esta linha para usar MaterialPageRoute
import "../views/app/pages/home.dart";
import '../views/login/login_screen.dart';

class AppRoutes {
  static const String initial = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initial:
        return MaterialPageRoute(builder: (_) => const Initialscreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return null;
    }
  }
}
