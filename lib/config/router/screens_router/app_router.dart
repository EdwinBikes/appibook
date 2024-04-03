import 'package:appi_prueba/presentation/presentation.dart';
import 'package:appi_prueba/presentation/screens/landing/landing_screen.dart';
import 'package:appi_prueba/presentation/screens/login/forgot_password.dart';
import 'package:appi_prueba/presentation/screens/login/new_password.dart';
import 'package:appi_prueba/presentation/screens/login/register_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/home-screen', routes: [
  ///landing-screen, para que se vea la primera pantalla
  GoRoute(
    path: '/landing-screen',
    name: LandingScreen.name,
    builder: (context, state) => const LandingScreen(),
  ),
  GoRoute(
    path: '/login-screen',
    name: LoginScreen.name,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/register-screen',
    name: RegisterScreen.name,
    builder: (context, state) => const RegisterScreen(),
  ),
  GoRoute(
    path: '/home-screen',
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/newpassword-screen',
    name: NewPasswordScreen.name,
    builder: (context, state) => const NewPasswordScreen(),
  ),
  GoRoute(
    path: '/forgot-screen',
    name: ForgotScreen.name,
    builder: (context, state) => const ForgotScreen(),
  ),
]);