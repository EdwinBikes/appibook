import 'package:appi_prueba/presentation/screens/theme/theme_change_screen.dart';
import 'package:go_router/go_router.dart';

import 'package:appi_prueba/presentation/presentation.dart';

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
    builder: (context, state) => LoginScreen(),
  ),
  GoRoute(
    path: '/register-screen',
    name: RegisterScreen.name,
    builder: (context, state) => RegisterScreen(),
  ),
  GoRoute(
    path: '/home-screen',
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/homeview-screen',
    name: HomeViewScreen.name,
    builder: (context, state) => const HomeViewScreen(),
  ),
  GoRoute(
    path: '/theme-screen',
    name: ThemeChangeScreen.name,
    builder: (context, state) => const ThemeChangeScreen(),
  ),
]);
