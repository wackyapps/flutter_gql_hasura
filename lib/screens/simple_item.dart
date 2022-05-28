import 'package:flutter/material.dart';
import 'package:gql_flutter_todo/config/authToken.dart';
import 'package:gql_flutter_todo/config/client.dart';
import 'package:gql_flutter_todo/graphql/queries/resturants/resturants_queries.dart';
import 'package:gql_flutter_todo/models/resturant/resturantInfo.dart';
import 'package:gql_flutter_todo/repositories/resturant_repository.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ItemsListing extends StatefulWidget {
  const ItemsListing({Key? key}) : super(key: key);

  @override
  State<ItemsListing> createState() => _ItemsListingState();
}

class _ItemsListingState extends State<ItemsListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Data Without Layer"),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(ResturantQueries.getItemsAll),
        ),
        builder: (QueryResult vart,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (vart.hasException) {
            // if there is error in response then show error
            return Text(vart.exception.toString());
          }

          if (vart.isLoading) {
            // if response is loading then show loading indicator
            return const Text('Loading');
          }

          // it can be either Map or List
          // List<Book> books = [];

          // var _listOfBooksJson = json.decode(result.data!['list']);

          // print("result data ${_listOfBooksJson}");

          // return SizedBox(
          //   child: Text("Data is loaded"),
          // );

          List VariantsList = vart.data!['list'];
          print(VariantsList);
//         // print the response in ListView using ListView.builder
          return ListView.builder(
            itemCount: VariantsList.length,
            itemBuilder: (context, i) {
              return ListTile(
                title: Text(VariantsList[i]['items']),
              );
            },
          );
        },
      ),
    );
  }
}
