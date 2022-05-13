import 'package:flutter/material.dart';
import 'package:gql_flutter_todo/config/gql_string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Config {
  static final HttpLink httpLink = HttpLink(
    gqlString,
  );

  static late String _token;
  static final AuthLink authLink = AuthLink(getToken: () async => _token);

  static final WebSocketLink webSocketLink = WebSocketLink(
    'wss://api.github.com/graphql',
    config: SocketClientConfig(
      autoReconnect: true,
      inactivityTimeout: const Duration(seconds: 30),
      initialPayload: () async {
        return {
          'headers': {'Authorization': _token}
        };
      },
    ),
  );

  static final Link link = authLink.concat(httpLink).concat(webSocketLink);
  // static String token;
  static ValueNotifier<GraphQLClient> initializeClient(String token) {
    _token = token;
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(cache: GraphQLCache(store: HiveStore()), link: link),
    );
    return client;
  }
}
