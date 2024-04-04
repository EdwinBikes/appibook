import 'dart:convert';
import 'package:http/http.dart' as http;

// Modelo de datos para representar un libro
class Book {
  final String title;
  final String subtitle;
  final String isbn13;
  final String price;
  final String image;
  final String url;

  Book({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      subtitle: json['subtitle'],
      isbn13: json['isbn13'],
      price: json['price'],
      image: json['image'],
      url: json['url'],
    );
  }
}

// Servicio para obtener libros disponibles desde la API IT Bookstore
class BookService {
  Future<List<Book>> getAvailableBooks() async {
    final response =
        await http.get(Uri.parse('https://api.itbook.store/1.0/new'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> booksJson = data['books'];
      return booksJson.map((json) => Book.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load available books');
    }
  }
}
