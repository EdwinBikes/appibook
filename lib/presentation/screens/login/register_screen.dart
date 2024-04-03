import 'package:appi_prueba/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  static const name = 'register-screen';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _passwordsMatch = true;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_comparePasswords);
    _confirmPasswordController.addListener(_comparePasswords);
  }

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
                'Hola! registrate para iniciar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
              child: CustomTextField(
                labelText: 'Nombre de usuario',
                hintText: 'Nombre y apellido',
                keyboardType: TextInputType.name,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: CustomTextField(
                labelText: 'Correo Electronico',
                hintText: 'Correo electronico',
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  hintText: 'Contraseña',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  errorText:
                      _passwordsMatch ? null : 'Las contraseñas no coinciden',
                  labelStyle: TextStyle(
                    color: _passwordsMatch ? Colors.black : Colors.red,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirma tu contraseña',
                  hintText: 'Contraseña',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  errorText:
                      _passwordsMatch ? null : 'Las contraseñas no coinciden',
                  labelStyle: TextStyle(
                    color: _passwordsMatch ? Colors.black : Colors.red,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const CustomButtonBlack(
              destination: '/createdates-screen',
              buttonText: 'Ingresar',
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

  void _comparePasswords() {
    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        _passwordsMatch = false;
      });
    } else {
      setState(() {
        _passwordsMatch = true;
      });
    }
  }
}
