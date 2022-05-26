import 'package:flutter/material.dart';
import 'package:gql_flutter_todo/graphql/queries/resturants/resturants_queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class single_rest extends StatefulWidget {
  const single_rest({Key? key}) : super(key: key);

  @override
  State<single_rest> createState() => _single_restState();
}

class _single_restState extends State<single_rest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Data Without Layer"),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(ResturantQueries.getResturantsAll),
        ),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.hasException) {
            // if there is error in response then show error
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
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

          List resturantsList = result.data!['list'];
          print(resturantsList);
//         // print the response in ListView using ListView.builder
          return ListView.builder(
            itemCount: resturantsList.length,
            itemBuilder: (context, i) {
              return ListTile(
                title: Text(resturantsList[i]['name']),
                subtitle: Text(resturantsList[i]['location']),
                trailing: Text(resturantsList[i]['item']['items']),
              );
            },
          );
        },
      ),
    );
  }
}
