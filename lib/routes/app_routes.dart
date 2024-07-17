import 'package:flutter/material.dart';
import '../views/home/home_screen.dart';
import '../views/register/register_screen.dart'; // Importe esta linha para usar MaterialPageRoute
import "../views/home/home.dart";
import '../views/login/widgets/login_screen.dart';

class AppRoutes {
  static const String initial = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String homepage = '/homePage';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initial:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      default:
        return null;
    }
  }
}
