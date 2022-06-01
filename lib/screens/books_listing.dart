import 'package:flutter/material.dart';
import 'package:gql_flutter_todo/provider/books_provider.dart';
import 'package:gql_flutter_todo/screen/Books/add_books.dart';
import 'package:gql_flutter_todo/screens/widgets/book_list_item.dart';
import 'package:provider/provider.dart';

class BooksListing extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // call provider to get the books list
    final booksModel = Provider.of<BooksProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paginated Books Lists With Service Layer '),
      ),

      // Body showing List of Books
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          // when data is loading we will show loading indicator
          child: (booksModel.booksLoading)
              ? CircularProgressIndicator()

              // when data is loading we will show the list of books with ListView.builder
              : ListView.builder(
                  itemCount: booksModel.getBooks.length,
                  itemBuilder: (context, index) {
                    return BookListItem(book: booksModel.getBooks[index]);
                  },
                ),
        ),
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddBooks(),
            ),
          );
        }),
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
