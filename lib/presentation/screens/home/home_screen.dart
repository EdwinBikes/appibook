import 'package:appi_prueba/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const Image(
            image: AssetImage('assets/images/login.png'),
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          Column(
            children: [
              const Spacer(),
              Text(
                'AppiBooks',
                style: GoogleFonts.katibeh(
                  fontSize: 90,
                ),
              ),
              const SizedBox(height: 10),
              const CustomButtonBlack(
                destination: '/login-screen',
                buttonText: 'Iniciar sesión',
              ),
              const SizedBox(height: 10),
              const CustomButtonWhite(
                destination: '/register-screen',
                buttonText: 'Regístrate',
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () => context.go('/register-screen'),
                child: Text(
                  '¿Necesitas ayuda?',
                  style: TextStyle(color: Colors.cyan[600]),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          )
        ],
      ),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}
