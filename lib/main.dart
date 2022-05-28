import 'package:flutter/material.dart';
import 'package:gql_flutter_todo/config/authToken.dart';
import 'package:gql_flutter_todo/config/client.dart';
import 'package:gql_flutter_todo/graphql/queries/resturants/resturants_queries.dart';
import 'package:gql_flutter_todo/screens/resturant_listing.dart';
import 'package:gql_flutter_todo/screens/simple_resturant.dart';
import 'package:gql_flutter_todo/screens/simple_item.dart';
import 'package:gql_flutter_todo/screens/simple_variant.dart';
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
                    child: Text(
                      "Resturants List Using\nSimple Data Without Layer",
                      textAlign: TextAlign.center,
                    )),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemsListing(),
                        ),
                      );
                    },
                    child: Text(
                      "Items List Using\nSimple Data Without Layer",
                      textAlign: TextAlign.center,
                    )),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VariantsListing(),
                        ),
                      );
                    },
                    child: Text(
                      "Variants List Using\nSimple Data Without Layer",
                      textAlign: TextAlign.center,
                    )),
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
        ));
  }
}
