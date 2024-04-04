import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

  void navigateToHome(BuildContext context) {
    context.go('/home-screen');
  }

  void navigateToForgotPassword(BuildContext context) {
    context.go('/forgot-screen');
  }

  void signIn(BuildContext context) {
    final email = emailController.text;
    final password = passwordController.text;

    if (authService.signIn(email, password)) {
      // Si el inicio de sesión es exitoso, muestra una alerta de éxito
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Inicio de Sesión Exitoso'),
            content: const Text('¡Bienvenido!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Cierra la alerta
                  navigateToHome(context); // Navega a la pantalla de inicio
                },
                child: const Text('Aceptar'),
              ),
            ],
          );
        },
      );
    } else {
      // Si las credenciales son incorrectas, muestra una alerta de error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error de Inicio de Sesión'),
            content: const Text('Correo electrónico o contraseña incorrectos'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Cierra la alerta
                },
                child: const Text('Aceptar'),
              ),
            ],
          );
        },
      );
    }
  }
}

class User {
  final String email;
  final String password;

  User(this.email, this.password);
}

class AuthService {
  final List<User> _users = [
    User('usuario1@example.com', 'contraseña1'),
    User('usuario2@example.com', 'contraseña2'),
    // Agrega más usuarios según sea necesario
  ];

  bool signIn(String email, String password) {
    for (final user in _users) {
      if (user.email == email && user.password == password) {
        return true;
      }
    }
    return false;
  }
}
