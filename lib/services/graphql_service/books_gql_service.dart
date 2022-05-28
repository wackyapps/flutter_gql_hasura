import 'package:gql_flutter_todo/graphql/queries/books/books_queries.dart';
import 'package:gql_flutter_todo/models/books/book.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class BooksGQLService {
  BooksGQLService(this.client);
  final GraphQLClient client;

  // any service layer for any table of entity will have following minimum methods

  // list of paginates data object form server List<Books>
  // list of paginated search based results from the server
  // list of paginates sorting based results from the server
  // list of paginated search and sorting based results from the server

  // get single data object from server
  // create new data object on server
  // update data object on server
  // delete data object on server

// List of books paginated
  Future<List<Book>> getBooksPaginated(int limit, int offset) async {
    // getting response based on gql query
    final response = await client.query(QueryOptions(
      document: gql(BookQueries.getBooksPaginated),
      variables: <String, dynamic>{
        'limit': limit,
        'offset': offset,
      },
    ));

    if (response.hasException) {
      print("getBooksPaginated exception");
    }
    return _getListOfObjects(response.data!['books']);
  }

  // List of books paginated search
  Future<List<Book>> getBooksPaginatedSearch(
      int limit, int offset, String search) async {
    // getting response based on gql query
    final response = await client.query(QueryOptions(
      document: gql(BookQueries.getBooksPaginatedBySearch),
      variables: <String, dynamic>{
        'limit': limit,
        'offset': offset,
        'search': search,
      },
    ));

    if (response.hasException) {
      print("getBooksPaginatedSearch exception");
    }
    return _getListOfObjects(response.data!['books']);
  }

  // privae method to convert list of map to list of object
  List<Book> _getListOfObjects(List<dynamic> listOfBooksJson) {
    return listOfBooksJson.map((book) => Book.fromJson(book)).toList();
  }

  // Future<Book> getBook(String id) async {
  //   final response = await client.query(QueryOptions(
  //     documentNode: gql(r'''
  //       query ($id: ID!) {
  //         book(id: $id) {
  //           id
  //           title
  //           author
  //           description
  //           image
  //           price
  //           rating
  //         }
  //       }
  //     ''',
  //         variables: <String, dynamic>{
  //           'id': id,
  //         },
  //       ));

  //   if (response.hasException) {
  //     throw response.exception;
  //   }

  //   return Book.fromJson(response.data['book']);
  // }

  // Future<Book> createBook(BookInput input) async {
  //   final response = await client.mutate(MutationOptions(
  //     documentNode: gql(r'''
  //       mutation ($input: BookInput!) {
  //         createBook(input: $input) {
  //           id
  //           title
  //           author
  //           description
  //           image
  //           price
  //           rating
  //         }
  //       }
  //     ''',
  //         variables: <String, dynamic>{
  //           'input': input.toJson(),
  //         },
  //       ));

  //   if (response.hasException) {
  //     throw response.exception;
  //   }

  //   return Book.fromJson(response.data['createBook']);
  // }

  // Future<Book> updateBook(String id, BookInput input) async {
  //   final response = await client.mutate
}
