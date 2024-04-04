import 'package:appi_prueba/presentation/presentation.dart';
import 'package:appi_prueba/presentation/screens/login/controllers/controller_register.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static const name = 'register-screen';
  RegisterScreen({Key? key}) : super(key: key);

  final RegisterLogic logic = RegisterLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/home-screen');
                },
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
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
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
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
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
                  hintText: 'Contraseña',
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
                // Llama a la función de registro en la clase de lógica
                logic.registerUser(context);
              },
            ),
            const Spacer(),
            const TextBottomScreens(
              textPrimary: '¿Ya tienes una cuenta? ',
              textSecund: 'Login',
              textDestination: '/login-screen',
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
