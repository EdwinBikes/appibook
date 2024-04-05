import 'package:appi_prueba/infrastructure/models/api_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'api_config.dart'; // Importa la clase de configuración

class ApiService {
  Future<List<Book>> getAvailableBooks() async {
    final response = await http.get(
      Uri.parse(
          '${ApiConfig.baseUrl}/1.0/new'), // Construir la URL completa aquí
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> booksJson = json['books'];
      final List<Book> books =
          booksJson.map((bookJson) => Book.fromJson(bookJson)).toList();
      return books;
    } else {
      throw Exception('Failed to load books');
    }
  }
}
