import 'package:appi_prueba/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotScreen extends StatelessWidget {
  static const name = 'forgot-screen';
  const ForgotScreen({super.key});

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
                '¿Has olvidado tu contraseña?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Text(
                '¡No te preocupes! Ingrese la dirección de correo electrónico vinculada con su cuenta.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
            ),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 18),
              child: CustomTextField(
                labelText: 'Ingresa tu Email',
                hintText: AutofillHints.email,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: 30),
            const CustomButtonBlack(
              destination: '/newpassword-screen',
              buttonText: 'Enviar Código',
            ),
            const Spacer(),
            const TextBottomScreens(
              textPrimary: '¿Ya tienes una cuenta? ',
              textSecund: 'Login',
              textDestination: '/home-screen',
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
