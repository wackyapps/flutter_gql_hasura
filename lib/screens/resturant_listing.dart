import 'package:flutter/material.dart';
import 'package:gql_flutter_todo/config/authToken.dart';
import 'package:gql_flutter_todo/config/client.dart';
import 'package:gql_flutter_todo/models/resturant/resturantInfo.dart';
import 'package:gql_flutter_todo/repositories/resturant_repository.dart';

class ResturantsListing extends StatefulWidget {
  const ResturantsListing({Key? key}) : super(key: key);

  @override
  State<ResturantsListing> createState() => _ResturantsListingState();
}

class _ResturantsListingState extends State<ResturantsListing> {
  List<ResturantsNames> resturant = [];
  bool _loading = false;
  final ResturantsRepository _resturantsRepository = ResturantsRepository(
      Config.initializeGQLClient(AuthTokenRepository().getAuthToken().token));
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // books repository
    fetchResturants();
  }

  void fetchResturants() async {
    setState(() {
      _loading = true;
    });
    resturant = await _resturantsRepository.getResturantsPaginated(3, 2);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books List Using Service and Repository Layer'),
      ),
      body: Center(
        child: (_loading)
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: resturant.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(resturant[i].name!),
                    subtitle: Text(resturant[i].location!),
                  );
                },
              ),
      ),
    );
  }
}
