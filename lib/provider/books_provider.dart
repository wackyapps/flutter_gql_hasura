// This is the class of View Model for Books Listing Screen and Books other screens.
import 'package:flutter/foundation.dart';
import 'package:gql_flutter_todo/config/authToken.dart';
import 'package:gql_flutter_todo/config/client.dart';
import 'package:gql_flutter_todo/models/books/book.dart';
import 'package:gql_flutter_todo/services/graphql_service/books_gql_service.dart';

class BooksProvider extends ChangeNotifier {
  // gql service object
  late BooksGQLService _booksGQLService;

  // constructor
  BooksProvider() {
    _booksGQLService = BooksGQLService(
        Config.initializeGQLClient(AuthTokenRepository().getAuthToken().token));
    // when constructor will be run we will load the data into the books array in memory
    getBooksAll();
    // getBooksPaginated(100, 0);
  }

  // List of books
  List<Book> _books = [];

  // getter
  List<Book> get getBooks => _books;

  // setter
  set setBooks(List<Book> books) {
    this._books = books;
    notifyListeners();
  }

// get all books
  void getBooksAll() async {
    setBooksLoading = true;
    List<Book> books = await _booksGQLService.getBooksAll();
    setBooks = books;
    setBooksLoading = false;
    // return books;
  }

  // get paginated books
  void getBooksPaginated(int limit, int offset) async {
    setBooksLoading = true;
    List<Book> books = await _booksGQLService.getBooksPaginated(limit, offset);
    setBooks = books;
    setBooksLoading = false;
    // return books;
  }

  // loading
  bool _loading = false;
  // getter
  bool get booksLoading => _loading;
  // setter
  set setBooksLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  // add book
  void addBook(Book book) {
    _books.add(book);
    notifyListeners();
  }

  // remove book
  void deleteBook(Book book) async {
    // remove from gql
    Book _deletedBook = await _booksGQLService.deleteBook(book.id!);
    if (_deletedBook != null) {
      // remove from memory
      _books.remove(book);
      notifyListeners();
    }
  }

  // get book by id
  Book getBookById(String id) {
    return _books.firstWhere((book) => book.id == id);
  }
}
