// import 'package:flutter/material.dart';
// import 'package:gql_flutter_todo/config/authToken.dart';
// import 'package:gql_flutter_todo/config/client.dart';
// import 'package:gql_flutter_todo/graphql/queries/books/books_queries.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

// main() async {
//   await initHiveForFlutter(); // this is called so that Hive database is created and initialized to be used by flutter
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GraphQLProvider(
//       client:
//           Config.initializeClient(AuthTokenRepository().getAuthToken().token),
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: const MyHomePage(title: 'GraphQL Demo'),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   final String title;
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: Query(
//         options: QueryOptions(
//           document: gql(BookQueries.getBooksAll),
//         ),
//         builder: (QueryResult result,
//             {VoidCallback? refetch, FetchMore? fetchMore}) {
          
//           // if there is error in response then show error
//           if (result.hasException) {
//             return Text(result.exception.toString());
//           }
          
//           // if response is loading then show loading indicator
//           if (result.isLoading) {
//             return const Text('Loading');
//           }

//           // it can be either Map or List
//           List books = result.data!['list'];
//         // print the response in ListView using ListView.builder
//           return ListView.builder(
//             itemCount: books.length,

//             itemBuilder: (context, index) {
              
//               return ListTile(
//                 title: Text(books[index]['title']),
//                 subtitle: Text(books[index]['isbn']),
//                 trailing: CircleAvatar(
//                   backgroundImage: NetworkImage(books[index]['thumbnail']),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
