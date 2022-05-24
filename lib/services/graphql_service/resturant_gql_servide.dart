import 'package:gql_flutter_todo/graphql/queries/resturants/resturants_queries.dart';
import 'package:gql_flutter_todo/models/resturant/resturantInfo.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ResturantsGQLService {
  ResturantsGQLService(this.client);
  final GraphQLClient client;

  Future<List<ResturantsNames>> getResturantsPaginated(
      int limit, int offset) async {
    final response = await client.query(QueryOptions(
      document: gql(ResturantQueries.getResturantsPaginated),
      variables: <String, dynamic>{
        'limit': limit,
        'offset': offset,
      },
    ));

    if (response.hasException) {
      // throw response.exception;
      print("getResturantsPaginated exception");
    }

    return (response.data!['resturants_names'] as List)
        .map((resturant) => ResturantsNames.fromJson(resturant))
        .toList();
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
