import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookListPage extends StatefulWidget {
  const BookListPage({Key? key}) : super(key: key);

  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  List<dynamic> _books = [];

  @override
  void initState() {
    super.initState();
    _fetchBooks();
  }

  Future<void> _fetchBooks() async {
    final response =
        await http.get(Uri.parse('https://api.itbook.store/1.0/new'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        _books = data['books'];
      });
    } else {
      throw Exception('Failed to load books');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Information'),
      ),
      body: ListView.builder(
        itemCount: _books.length,
        itemBuilder: (BuildContext context, int index) {
          final book = _books[index];
          return ListTile(
            leading: Image.network(book['image']),
            title: Text(book['title']),
            subtitle: Text(book['subtitle']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        BookDetailsPage(isbn13: book['isbn13'])),
              );
            },
          );
        },
      ),
    );
  }
}

class BookDetailsPage extends StatefulWidget {
  final String isbn13;

  const BookDetailsPage({Key? key, required this.isbn13}) : super(key: key);

  @override
  _BookDetailsPageState createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  Map<String, dynamic> _bookDetails = {};

  @override
  void initState() {
    super.initState();
    _fetchBookDetails();
  }

  Future<void> _fetchBookDetails() async {
    final response = await http
        .get(Uri.parse('https://api.itbook.store/1.0/books/${widget.isbn13}'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        _bookDetails = data;
      });
    } else {
      throw Exception('Failed to load book details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_bookDetails['title'] ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_bookDetails.isNotEmpty) ...[
              Image.network(_bookDetails['image']),
              Text(_bookDetails['title'] ?? ''),
              Text(_bookDetails['subtitle'] ?? ''),
              Text('Authors: ${_bookDetails['authors'] ?? ''}'),
              Text('Publisher: ${_bookDetails['publisher'] ?? ''}'),
              Text('Pages: ${_bookDetails['pages'] ?? ''}'),
              Text('Year: ${_bookDetails['year'] ?? ''}'),
              Text('Rating: ${_bookDetails['rating'] ?? ''}'),
              Text('Price: ${_bookDetails['price'] ?? ''}'),
              Text('Description: ${_bookDetails['desc'] ?? ''}'),
            ] else ...[
              const Center(child: CircularProgressIndicator()),
            ],
          ],
        ),
      ),
    );
  }
}
