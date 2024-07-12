import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final user = ParseUser(_usernameController.text, _passwordController.text, null);
      final response = await user.login();

      if (response.success) {
        print('Logged in: ${response.result.username}');
        // Navegar para a próxima tela após o login
      } else {
        if (response.error != null) {
          print('Login failed: ${response.error!.message}');
          // Mostrar mensagem de erro ao usuário
        } else {
          print('Login failed: Unknown error');
        }
      }
    } catch (e) {
      print('Error logging in: $e');
      // Mostrar mensagem de erro genérico
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? CircularProgressIndicator()
        : Column(
      children: [
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(labelText: 'Usuário'),
        ),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(labelText: 'Senha'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _login,
          child: Text('Login'),
        ),
      ],
    );
  }
}
