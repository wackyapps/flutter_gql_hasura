import 'package:flutter/material.dart';
import 'package:gql_flutter_todo/graphql/queries/bookinfo/bookinfo.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class completeBookinfo extends StatefulWidget {
  const completeBookinfo({Key? key}) : super(key: key);

  @override
  State<completeBookinfo> createState() => _completeBookinfoState();
}

class _completeBookinfoState extends State<completeBookinfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("complete Book info List Without Service Layer"),

        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.arrow_circle_right),
        //     onPressed: () {
        //       // navigate to books listing
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => BooksListing(),
        //         ),
        //       );
        //     },
        //   ),
        // ],
      ),
      body: Query(
        options: QueryOptions(
          document: gql(BooksInfoQueries.getBooksInfoAll),
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

          List getBooksInfoList = result.data!['list'];
//         // print the response in ListView using ListView.builder
          return ListView.builder(
            itemCount: getBooksInfoList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("Book Title: " + getBooksInfoList[index]['title']),
                subtitle: Text("author Name: " +
                    getBooksInfoList[index]["author"]["first_name"] +
                    " " +
                    getBooksInfoList[index]["author"]["last_name"]),
                trailing: Text(
                    "Email : " + getBooksInfoList[index]["author"]["email"]),
              );
            },
          );
        },
      ),
    );
  }
}
