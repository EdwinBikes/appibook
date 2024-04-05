import 'package:flutter/material.dart';
import 'package:appi_prueba/infrastructure/models/api_model.dart';

class CustomCarousel extends StatelessWidget {
  final List<Book> books;

  const CustomCarousel({required this.books, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: books.length,
      itemBuilder: (BuildContext context, int position) {
        return imageSlider(position);
      },
    );
  }

  Widget imageSlider(int position) {
    return Card(
      child: Column(
        children: [
          Image.network(books[position].image),
          Text(books[position].title),
          // Otros widgets para mostrar información del libro
        ],
      ),
    );
  }
}
