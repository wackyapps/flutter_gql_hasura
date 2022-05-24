import 'package:gql_flutter_todo/models/resturant/resturantInfo.dart';
import 'package:gql_flutter_todo/services/graphql_service/resturant_gql_servide.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ResturantsRepository {
  final GraphQLClient client;
  late ResturantsGQLService _resturantsGQLService;
  ResturantsRepository(this.client) {
    _resturantsGQLService = ResturantsGQLService(client);
  }

  Future<List<ResturantsNames>> getResturantsPaginated(
      int limit, int offset) async {
    return _resturantsGQLService.getResturantsPaginated(limit, offset);
  }
}
