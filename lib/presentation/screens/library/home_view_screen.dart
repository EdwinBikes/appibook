import 'package:flutter/material.dart';
import 'package:appi_prueba/presentation/screens/library/controller/home_view_content.dart';

class HomeViewScreen extends StatelessWidget {
  static const name = 'homeview-screen';

  const HomeViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biblioteca de libros'),
      ),
      body: const HomeViewContent(),
    );
  }
}
