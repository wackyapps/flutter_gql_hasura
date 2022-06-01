// import 'package:flutter/material.dart';
// import 'package:gql_flutter_todo/config/authToken.dart';
// import 'package:gql_flutter_todo/config/client.dart';
// import 'package:gql_flutter_todo/models/books/book.dart';
// import 'package:gql_flutter_todo/repositories/books_repository/books_repository.dart';
// import 'package:gql_flutter_todo/screen/Books/edit_books.dart';
// import 'package:gql_flutter_todo/screen/Books/add_books.dart';
// import 'package:gql_flutter_todo/screens/widgets/book_list_item.dart';
// import 'package:gql_flutter_todo/services/graphql_service/books_gql_service.dart';

// class BooksListing extends StatefulWidget {
//   const BooksListing({Key? key}) : super(key: key);
//   @override
//   State<BooksListing> createState() => _BooksListingState();
// }

// class _BooksListingState extends State<BooksListing> {
//   // This is the array / list of books where data will be loaded into for the front end UI
//   // This list will hod books model objects which are called domain objects
//   List<Book> books = [];

//   // This is simple loading indicator
//   bool _loading = false;

//   // final BooksRepository _booksRepository = BooksRepository(
//   //     Config.initializeGQLClient(AuthTokenRepository().getAuthToken().token));

//   // This is where we are calling the graphql service to get the data from the server
//   BooksGQLService _booksGQLService = BooksGQLService(
//       Config.initializeGQLClient(AuthTokenRepository().getAuthToken().token));

//   @override
//   void initState() {
//     super.initState();
//     // we will call fetch books to get the data from the server
//     fetchBooks();
//   }

//   void fetchBooks() async {
//     setState(() {
//       _loading = true;
//     });
//     // books = await _booksRepository.getBooksPaginated(10, 0);

//     // we will call fetch books to get the data from the server
//     books = await _booksGQLService.getBooksPaginated(10, 0);

//     setState(() {
//       _loading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Paginated Books Lists With Service Layer '),
//       ),

//       // Body showing List of Books
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Center(
//           // when data is loading we will show loading indicator
//           child: (_loading)
//               ? CircularProgressIndicator()

//               // when data is loading we will show the list of books with ListView.builder
//               : ListView.builder(
//                   itemCount: books.length,
//                   itemBuilder: (context, index) {
//                     return BookListItem(book: books[index]);
//                   },
//                 ),
//         ),
//       ),

//       // Floating Action Button
//       floatingActionButton: FloatingActionButton(
//         onPressed: (() {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => AddBooks(),
//             ),
//           );
//         }),
//         child: Icon(
//           Icons.add,
//           size: 30,
//         ),
//       ),
//     );
//   }
// }
