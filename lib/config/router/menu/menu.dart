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
      title: 'Recordar contraseña',
      subTitle: 'No recuerdas tu contraseña?',
      link: '/forgot-screen',
      icon: Icons.check_box_outline_blank_outlined),
  //TODO toca cambiar las pantallas siguientes
  MenuItem(
      title: 'Favoritos',
      subTitle: 'Puedes usar Caracteres alfanumericos y especiales',
      link: '/newpassword-screen',
      icon: Icons.check_box_outline_blank_outlined),
  MenuItem(
      title: 'Cerrar Sesion',
      subTitle: 'Se perderan todos tus datos guardados',
      link: '/register-screen',
      icon: Icons.check_box_outline_blank_outlined),
];
