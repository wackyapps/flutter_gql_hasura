import 'package:flutter/material.dart';
import 'package:gql_flutter_todo/config/authToken.dart';
import 'package:gql_flutter_todo/config/client.dart';
import 'package:gql_flutter_todo/models/books/book.dart';
import 'package:gql_flutter_todo/repositories/books_repository/books_repository.dart';
import 'package:gql_flutter_todo/screen/Books/delete_books.dart';
import 'package:gql_flutter_todo/screen/Books/edit_books.dart';
import 'package:gql_flutter_todo/screen/Books/add_books.dart';

class BooksListing extends StatefulWidget {
  const BooksListing({Key? key}) : super(key: key);

  @override
  State<BooksListing> createState() => _BooksListingState();
}

class _BooksListingState extends State<BooksListing> {
  List<Book> books = [];
  bool _loading = false;
  final BooksRepository _booksRepository = BooksRepository(
      Config.initializeGQLClient(AuthTokenRepository().getAuthToken().token));
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // books repository
    fetchBooks();
  }

  void fetchBooks() async {
    setState(() {
      _loading = true;
    });
    books = await _booksRepository.getBooksPaginated(10, 0);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paginated Books Lists With Service Layer '),
      ),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: (_loading)
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: (() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditBooks(),
                              ),
                            );
                          }),
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 226, 220, 220),
                                image: DecorationImage(
                                    image:
                                        NetworkImage(books[index].thumbnail!),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Book Title: " + books[index].title!),
                            InkWell(
                              onTap: (() {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //        // DeleteBooks(),
                                //   ),
                                // );
                              }),
                              child: Icon(
                                Icons.delete,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Book isbn: " + books[index].isbn!),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
