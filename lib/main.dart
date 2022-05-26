import 'package:flutter/material.dart';
import 'package:gql_flutter_todo/config/authToken.dart';
import 'package:gql_flutter_todo/config/client.dart';
import 'package:gql_flutter_todo/graphql/queries/resturants/resturants_queries.dart';
import 'package:gql_flutter_todo/screens/resturant_listing.dart';
import 'package:gql_flutter_todo/screens/simple_resturant.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

main() async {
  await initHiveForFlutter(); // this is called so that Hive database is created and initialized to be used by flutter
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client:
          Config.initializeClient(AuthTokenRepository().getAuthToken().token),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(
          title: 'Resturants',
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => single_rest(),
                        ),
                      );
                    },
                    child: Text("Simple Data Without Layer")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResturantsListing(),
                        ),
                      );
                    },
                    child: Text(
                      "Resturants Paginated List Using\nService and Repository Layer",
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          ),
        )
//       Query(
//         options: QueryOptions(
//           document: gql(ResturantQueries.getResturantsAll),
//         ),
//         builder: (QueryResult result,
//             {VoidCallback? refetch, FetchMore? fetchMore}) {
//           if (result.hasException) {
//             // if there is error in response then show error
//             return Text(result.exception.toString());
//           }

//           if (result.isLoading) {
//             // if response is loading then show loading indicator
//             return const Text('Loading');
//           }

//           // it can be either Map or List
//           // List<Book> books = [];

//           // var _listOfBooksJson = json.decode(result.data!['list']);

//           // print("result data ${_listOfBooksJson}");

//           // return SizedBox(
//           //   child: Text("Data is loaded"),
//           // );

//           List resturantsList = result.data!['list'];
//           print(resturantsList);
// //         // print the response in ListView using ListView.builder
//           return ListView.builder(
//             itemCount: resturantsList.length,
//             itemBuilder: (context, i) {
//               return ListTile(
//                 title: Text(resturantsList[i]['name']),
//                 subtitle: Text(resturantsList[i]['location']),
//                 trailing: Text(resturantsList[i]['item']['items']),
//               );
//             },
//           );
//         },
//       ),
        );
  }
}
