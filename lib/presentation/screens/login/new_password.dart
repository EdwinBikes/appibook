import 'package:appi_prueba/presentation/presentation.dart';
import 'package:appi_prueba/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewPasswordScreen extends StatelessWidget {
  static const name = 'newpassword-screen';
  final LoginController controller;

  const NewPasswordScreen({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 55),
            child: IconButton(
              onPressed: () => context.go('/home-screen'),
              icon: const Icon(
                Icons.arrow_back_ios_new,
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Crear una nueva contraseña',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: Text(
              'Su nueva contraseña debe ser única y no haberla utilizado anteriormente.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
            child: CustomTextField(
                suffixIcon: true,
                obscureText: true,
                labelText: 'Nueva Contraseña',
                hintText: 'Se recomienda alfa, numérica',
                keyboardType: TextInputType.visiblePassword,
                controller: controller.passwordController),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
            child: CustomTextField(
                suffixIcon: true,
                obscureText: true,
                labelText: 'Confirmar Contraseña',
                hintText: 'Confirma la contraseña',
                keyboardType: TextInputType.visiblePassword,
                controller: controller.passwordController),
          ),
          const SizedBox(height: 30),
          const CustomButton(
            textColor: Colors.white,
            backgroundColor: Colors.black,
            //destination: '/forgot-screen',
            buttonText: 'Restablecer Contraseña',
          ),
        ],
      ),
    );
  }
}
