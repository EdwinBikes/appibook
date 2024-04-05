import 'package:appi_prueba/infrastructure/models/api_model.dart'; // Asegúrate de importar el modelo de libro
import 'package:appi_prueba/infrastructure/models/service_api.dart';

class BookManager {
  // Lista de libros
  List<Book> books = [];

  // Método para cargar los libros
  Future<void> loadBooks() async {
    try {
      books = await ApiService().getAvailableBooks();
    } catch (e) {
      // Manejar el error de carga de libros, si es necesario
      print('Error loading books: $e');
    }
  }
}
