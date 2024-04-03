// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginAPI extends StatelessWidget {
  static const name = 'login-api-screen';
  const LoginAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Solicitud POST a la API'),
        ),
        body: const MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController campo1Controller = TextEditingController();
  final TextEditingController campo2Controller = TextEditingController();

  void _sendData() async {
    print('entrada a la funcion');
    final httpPackageUrl =
        Uri.parse('https://venti-monolite-api-o1h6-dev.fl0.io/auth/login');

    await http.post(httpPackageUrl, headers: <String, String>{}, body: {
      'email': campo1Controller.text,
      'password': campo2Controller.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: campo1Controller,
          decoration: const InputDecoration(
            hintText: 'usuario',
          ),
        ),
        TextField(
          controller: campo2Controller,
          decoration: const InputDecoration(
            hintText: 'Contraseñas',
          ),
        ),
        ElevatedButton(
          onPressed: _sendData,
          child: const Text('Enviar Datos'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    campo1Controller.dispose();
    campo2Controller.dispose();
    super.dispose();
  }
}
