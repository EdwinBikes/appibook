// archivo controller_login.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

  void navigateToHome(BuildContext context) {
    context.go('/homeview-screen');
  }

  void navigateToForgotPassword(BuildContext context) {
    context.go('/forgot-screen');
  }

  Future<void> signIn(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;

    print('Email ingresado: $email, Contraseña ingresada: $password');

    if (await authService.signIn(email, password)) {
      await saveEmail(email);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Inicio de Sesión Exitoso'),
            content: const Text('¡Bienvenido!'),
            actions: [
              TextButton(
                onPressed: () {
                  navigateToHome(context);
                },
                child: const Text('Aceptar'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error de Inicio de Sesión'),
            content: const Text('Correo electrónico o contraseña incorrectos'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Aceptar'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> saveEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }
}

class User {
  final String email;
  final String password;

  User(this.email, this.password);

  factory User.fromJson(Map<String, dynamic> json) =>
      User(json['email'], json['password']);
}

class AuthService {
  AuthService() {
    loadUsersFromSharedPreferences();
  }

  List<User> _users = [];

  Future<void> loadUsersFromSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? userJsonList = prefs.getStringList('users');
    print('Usuarios cargados: $_users');
    if (userJsonList != null) {
      _users = userJsonList
          .map((userJson) => User.fromJson(json.decode(userJson)))
          .toList();
    }
  }

  Future<bool> signIn(String email, String password) async {
    await loadUsersFromSharedPreferences(); // Cargar usuarios antes de iniciar sesión
    final user = _users.firstWhere(
        (user) => user.email == email && user.password == password,
        orElse: () => User('', ''));
    return user
        .email.isNotEmpty; // Si el email no está vacío, el usuario es válido
  }
}
