import 'package:appi_prueba/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:appi_prueba/presentation/presentation.dart';

class LoginScreen extends StatelessWidget {
  static const name = 'login-screen';

  final LoginController controller = LoginController();

  LoginScreen({Key? key}) : super(key: key);

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
                onPressed: () => controller.navigateToHome(context),
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                child: Text(
                  '¡Bienvenido!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.08),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.04,
                horizontal: 18,
              ),
              child: CustomTextField(
                labelText: 'Ingresa tu email',
                hintText: AutofillHints.email,
                keyboardType: TextInputType.emailAddress,
                controller: controller.emailController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: CustomTextField(
                obscureText: true,
                suffixIcon: true,
                labelText: 'Ingresa tu contraseña',
                hintText: AutofillHints.password,
                keyboardType: TextInputType.visiblePassword,
                controller: controller.passwordController,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: screenHeight * 0.015,
                ),
                child: GestureDetector(
                  onTap: () => controller.navigateToForgotPassword(context),
                  child: const Text(
                    'No recuerdas tu Contraseña?',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            CustomButton(
              textColor: Colors.white,
              buttonText: 'Ingresar',
              onPressed: () {
                controller.signIn(context);
              },
              backgroundColor: Colors.black,
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
