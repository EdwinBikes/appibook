import 'package:appi_prueba/infrastructure/models/appi_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Proveedor de datos para obtener la lista de libros disponibles
final availableBooksProvider = FutureProvider<List<Book>>((ref) async {
  final bookService = BookService();
  return bookService.getAvailableBooks();
});

// Pantalla para mostrar los libros disponibles
class HomeViewScreen extends ConsumerWidget {
  static const name = 'homeview-screen';
  const HomeViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availableBooksAsync =
        ref.watch(availableBooksProvider); // Cambio de watch a ref.watch

    return Scaffold(
      appBar: AppBar(
        title: const Text('Libros Disponibles'),
      ),
      body: availableBooksAsync.when(
        data: (books) => ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];
            return ListTile(
              title: Text(book.title),
              subtitle: Text(book.subtitle),
              leading: Image.network(book.image),
              onTap: () {
                // Aquí puedes agregar la lógica para navegar a los detalles del libro
              },
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
