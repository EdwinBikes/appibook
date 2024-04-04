import 'package:flutter/material.dart';

class RegisterLogic {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void registerUser(BuildContext context) {
    final String username = usernameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;
    final String confirmPassword = confirmPasswordController.text;

    // Aquí puedes realizar la lógica para registrar al usuario
    // Por ejemplo, puedes llamar a una función del backend para registrar al usuario
    // Una vez completada la lógica de registro, puedes navegar a otra pantalla
    Navigator.of(context).pushReplacementNamed('/login-screen');
  }
}
