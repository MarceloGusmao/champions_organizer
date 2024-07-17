// services/auth_service.dart

import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class AuthService {
  static Future<bool> login(String username, String password) async {
    try {
      final user = ParseUser(username, password, null);
      final response = await user.login();
      return response.success;
    } catch (e) {
      print('Login error: $e');
      return false;
    }
  }

  static Future<bool> register(
      String username, String password, String email) async {
    final user = ParseUser(username, password, email);
    try {
      final response = await user.signUp();
      return response.success;
    } catch (e) {
      print('Registration error: $e');
      return false;
    }
  }

  static Future<bool> logout() async {
    try {
      final user = ParseUser(null, null, null);
      final ParseResponse response = await user.logout();
      return response.success;
    } catch (e) {
      print('Registration error: $e');
      return false;
    }
  }
}
