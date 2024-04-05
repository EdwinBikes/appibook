import 'package:flutter/material.dart';
import 'package:appi_prueba/infrastructure/models/api_model.dart';
import 'package:appi_prueba/infrastructure/models/book_manager.dart';

class BookListViewScreen extends StatefulWidget {
  static const String name = '/book-list-view';

  @override
  _BookListViewScreenState createState() => _BookListViewScreenState();
}

class _BookListViewScreenState extends State<BookListViewScreen> {
  final BookManager _bookManager = BookManager();

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  Future<void> _loadBooks() async {
    try {
      await _bookManager.loadBooks();
      setState(() {}); // Actualiza el estado para reflejar los cambios
    } catch (e) {
      // Manejar el error de carga de libros, si es necesario
      print('Error loading books: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Libros Disponibles'),
      ),
      body: _buildBookList(),
    );
  }

  Widget _buildBookList() {
    final List<Book> books = _bookManager.books;

    if (books.isEmpty) {
      return const Center(
        child:
            CircularProgressIndicator(), // Muestra un indicador de carga si no hay libros
      );
    }

    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final Book book = books[index];
        return ListTile(
          leading: Image.network(book.image),
          title: Text(book.title),
          subtitle: Text(book.subtitle),
          onTap: () {
            // Agrega aquí la navegación a la pantalla de detalles del libro si es necesario
          },
        );
      },
    );
  }
}
