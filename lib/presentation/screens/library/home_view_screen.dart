import 'package:flutter/material.dart';
import 'package:appi_prueba/infrastructure/models/api_model.dart';
import 'package:appi_prueba/infrastructure/models/service_api.dart';
import 'package:appi_prueba/presentation/widgets/customs/image/custom_carousel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewScreen extends StatefulWidget {
  static const name = 'homeview-screen';

  const HomeViewScreen({Key? key}) : super(key: key);

  @override
  _HomeViewScreenState createState() => _HomeViewScreenState();
}

class _HomeViewScreenState extends State<HomeViewScreen> {
  late List<Book> _books = [];
  late List<Book> _searchResult = [];
  late List<String> _recentSearches = [];
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _loadBooks();
    _loadRecentSearches();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  Future<void> _loadBooks() async {
    try {
      final books = await ApiService().getAvailableBooks();
      setState(() {
        _books = books;
      });
    } catch (e) {
      print('Error loading books: $e');
    }
  }

  Future<void> _loadRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    final searches = prefs.getStringList('recent_searches') ?? [];
    setState(() {
      _recentSearches = searches;
    });
  }

  Future<void> _saveRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('recent_searches', _recentSearches);
  }

  void _searchBooks(String query) {
    if (query.isEmpty) {
      setState(() {
        _searchResult.clear();
      });
      return;
    }

    final List<Book> result = _books.where((book) {
      return book.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      _searchResult = result;
    });
  }

  void _updateRecentSearches(String query) {
    if (_recentSearches.contains(query)) {
      // Si la búsqueda ya está en la lista, muévela al principio
      _recentSearches.remove(query);
    }
    _recentSearches.insert(0, query);
    // Limitar la lista a 5 elementos
    if (_recentSearches.length > 5) {
      _recentSearches.removeLast();
    }
    _saveRecentSearches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biblioteca de libros'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                focusNode: _searchFocusNode,
                onChanged: _searchBooks,
                onSubmitted: _onSearchSubmitted,
                decoration: const InputDecoration(
                  labelText: 'Buscar libros',
                  hintText: 'Ingrese el título del libro',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            if (_searchFocusNode.hasFocus && _recentSearches.isNotEmpty)
              _buildRecentSearches(),
            _buildCarousel(),
          ],
        ),
      ),
    );
  }

  void _onSearchSubmitted(String query) {
    if (query.isNotEmpty) {
      _searchBooks(query);
      _updateRecentSearches(query);
    }
    _searchController.clear();
    _searchFocusNode.unfocus();
  }

  Widget _buildRecentSearches() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Últimas búsquedas:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: _recentSearches.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_recentSearches[index]),
              onTap: () {
                _searchController.text = _recentSearches[index];
                _onSearchSubmitted(_recentSearches[index]);
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildCarousel() {
    return CustomCarousel(
      books: _searchResult.isNotEmpty ? _searchResult : _books,
    );
  }
}
