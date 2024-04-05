import 'package:appi_prueba/infrastructure/models/api_model.dart'; // Asegúrate de importar el modelo de libro
import 'package:appi_prueba/infrastructure/models/service_api.dart';

class BookManager {
  List<Book> books = [];

  // Método para cargar los libros
  Future<void> loadBooks() async {
    try {
      books = await ApiService().getAvailableBooks();
    } catch (e) {
      // print('Error loading books: $e');
    }
  }
}
