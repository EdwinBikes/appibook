import 'package:flutter/material.dart';
import 'package:appi_prueba/presentation/presentation.dart';
import 'package:go_router/go_router.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                onPressed: () => context.go('/home-screen'),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                ),
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
            SizedBox(height: screenHeight * 0.02),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                child: Text(
                  'Inicia Sesión',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
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
                labelText: 'Ingresa tu contraseña',
                hintText: 'Contraseña',
                keyboardType: TextInputType.visiblePassword,
                controller: controller.passwordController,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            CustomButton(
              textColor: Colors.white,
              buttonText: 'Ingresar',
              onPressed: () {
                // Verifica si se han ingresado tanto el correo como la contraseña
                if (controller.emailController.text.isNotEmpty &&
                    controller.passwordController.text.isNotEmpty) {
                  // Si ambos campos no están vacíos, intenta iniciar sesión
                  controller.signIn(context);
                } else {
                  // Si uno o ambos campos están vacíos, muestra un mensaje de error
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Error'),
                        content: const Text(
                            'Por favor ingresa tu correo y contraseña.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Aceptar'),
                          ),
                        ],
                      );
                    },
                  );
                }
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
