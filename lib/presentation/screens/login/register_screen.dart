import 'package:appi_prueba/presentation/presentation.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  static const name = 'register-screen';
  RegisterScreen({Key? key}) : super(key: key);

  final RegisterLogic logic = RegisterLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                  onPressed: () => context.go('/home-screen'),
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                  ),
                ),
              ),
              const SizedBox(height: 35),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Hola! Crea una cuenta para iniciar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                child: CustomTextField(
                  labelText: 'Nombre de usuario',
                  hintText: 'Nombre y apellido',
                  keyboardType: TextInputType.name,
                  controller: logic.usernameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: CustomTextField(
                  labelText: 'Correo Electronico',
                  hintText: 'Correo electronico',
                  keyboardType: TextInputType.emailAddress,
                  controller: logic.emailController,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    hintText: 'Contraseña',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                  ),
                  controller: logic.passwordController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirma tu contraseña',
                    hintText: 'Confirma tu contraseña',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                  ),
                  controller: logic.confirmPasswordController,
                ),
              ),
              const SizedBox(height: 30),
              CustomButton(
                textColor: Colors.white,
                backgroundColor: Colors.black,
                buttonText: 'Registrar',
                onPressed: () {
                  logic.registerUser(context);
                },
              ),
              const SizedBox(height: 16),
              const TextBottomScreens(
                textPrimary: '¿Ya tienes una cuenta? ',
                textSecund: 'Login',
                textDestination: '/login-screen',
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
