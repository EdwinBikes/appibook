import 'package:appi_prueba/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  static const name = 'login-screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

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
                  )),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                  child: Text('¡Bienvenido!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ))),
            ),
            SizedBox(height: screenHeight * 0.08),
            Padding(
                padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.04, horizontal: 18),
                child: const CustomTextField(
                  labelText: 'Ingresa tu email',
                  hintText: AutofillHints.email,
                  keyboardType: TextInputType.emailAddress,
                )),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: CustomTextField(
                obscureText: true,
                suffixIcon: true,
                labelText: 'Ingresa tu contraseña',
                hintText: AutofillHints.password,
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 18, vertical: screenHeight * 0.015),
                  child: GestureDetector(
                    onTap: () => context.go('/forgot-screen'),
                    child: const Text(
                      'No recuerdas tu Contraseña?',
                      style: TextStyle(fontSize: 13),
                    ),
                  )),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            const CustomButtonBlack(
              destination: '/home-screen',
              buttonText: 'Ingresar',
            ),
            SizedBox(
              height: screenHeight * 0.22,
            ),
            const Spacer(),
            const TextBottomScreens(
              textPrimary: '¿No tienes una cuenta? ',
              textSecund: 'Registrate Ahora',
              textDestination: '/register-screen',
              showDialogOption: true,
            ),
          ],
        ),
      ),
    );
  }
}
