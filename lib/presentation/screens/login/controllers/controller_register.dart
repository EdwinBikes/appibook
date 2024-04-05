import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appi_prueba/presentation/screens/login/controllers/controller_login.dart';

class RegisterLogic {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  List<User> _users = []; // Definición de la lista de usuarios

  Future<void> saveUserInfo(
      String username, String email, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> usersJsonList = prefs.getStringList('users') ?? [];
    final Map<String, dynamic> userData = {
      'username': username,
      'email': email,
      'password': password
    };
    final String userJson = json.encode(userData);
    usersJsonList.add(userJson);
    await prefs.setStringList('users', usersJsonList);
  }

  Future<void> loadUsersFromSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? userJsonList = prefs.getStringList('users');

    if (userJsonList != null) {
      final List usersList =
          userJsonList.map((userJson) => json.decode(userJson)).toList();
      _users = usersList.map((user) => User.fromJson(user)).toList();
    }
  }

  Future<bool> isEmailRegistered(String email) async {
    await loadUsersFromSharedPreferences();
    return _users.any((user) => user.email == email);
  }

  void registerUser(BuildContext context) async {
    final String username = usernameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;
    final String confirmPassword = confirmPasswordController.text;

    final scaffoldContext = context;

    if (password != confirmPassword) {
      showDialog(
        context: scaffoldContext,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Las contraseñas no coinciden.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      final bool isRegistered = await isEmailRegistered(email);
      if (isRegistered) {
        showDialog(
          context: scaffoldContext,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: const Text('El correo electrónico ya está registrado.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        await saveUserInfo(username, email, password);

        showDialog(
          context: scaffoldContext,
          builder: (context) => AlertDialog(
            title: const Text('Éxito'),
            content: const Text('Usuario creado satisfactoriamente.'),
            actions: [
              TextButton(
                onPressed: () => context.go('/login-screen'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }
}
