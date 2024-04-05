import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appi_prueba/infrastructure/infrastructure.dart';
import 'package:appi_prueba/presentation/presentation.dart';

class HomeViewContent extends StatefulWidget {
  const HomeViewContent({Key? key}) : super(key: key);

  @override
  _HomeViewContentState createState() => _HomeViewContentState();
}

class _HomeViewContentState extends State<HomeViewContent> {
  late List<Book> _books = [];
  late List<Book> _searchResult = [];
  late List<String> _recentSearches = [];
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadBooks();
    _loadRecentSearches();
    _simulateLoading();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  Future<void> _simulateLoading() async {
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
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
      _recentSearches.remove(query);
    }
    _recentSearches.insert(0, query);

    if (_recentSearches.length > 5) {
      _recentSearches.removeLast();
    }
    _saveRecentSearches();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? _buildLoading() : _buildContent();
  }

  Widget _buildContent() {
    return SingleChildScrollView(
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
    );
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

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
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
}
