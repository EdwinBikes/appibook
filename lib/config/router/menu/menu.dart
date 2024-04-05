import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Iniciar Sesion',
      subTitle: 'Login',
      link: '/login-screen',
      icon: Icons.person),
  MenuItem(
      title: 'Crear perfil',
      subTitle: 'No tienes una cuenta? Crea una.',
      link: '/createdates-screen',
      icon: Icons.person_add),
  MenuItem(
      title: 'Contenido de la APP',
      subTitle: 'Landing',
      link: '/landing-screen',
      icon: Icons.apple),
  MenuItem(
      title: 'Cambiar Apariencia de la APP',
      subTitle: 'Colores',
      link: '/theme-screen',
      icon: Icons.color_lens),
];
