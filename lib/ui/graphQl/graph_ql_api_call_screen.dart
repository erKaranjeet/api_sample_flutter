import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlAPICallScreen extends StatefulWidget {

  @override
  GraphQlAPICallScreenState createState() => GraphQlAPICallScreenState();
}

class GraphQlAPICallScreenState extends State<GraphQlAPICallScreen> {

  late GraphQLClient client;

  @override
  void initState() {
    super.initState();

    initAPICall();
  }

  Future<void> initAPICall() async {
    final HttpLink httpLink = HttpLink(
      'https://rickandmortyapi.com/graphql',
    );
    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
    );
    final Link link = authLink.concat(httpLink);

    client = GraphQLClient(
        link: link,
        // The default store is the InMemoryStore, which does NOT persist to disk
        cache: GraphQLCache(store: HiveStore(),
        ),
      );

    //GraphQl has 2 types of requests
    //1 - Query - to get data
    //2 - Mutation - to add data to server

    QueryResult queryResult = await client.query(
      QueryOptions
        (document: gql(
        '''query {
        characters(page: 2, filter: {name: "rick"}) {//Function to call with parameters e.g 
        results {
        name    //You can add or remove any parameter that is plus point of graphql
        image
        }
        }
        }''',
      ),
      ),
    );

    setState(() {
      //API response
      //queryResult.data gives the response data
      //queryResult.exception gives the response exception error
      //queryResult.hasException used to check if any exception
      //queryResult.context.entry<HttpLinkResponseContext>()?.statusCode to get status code of response
      print(queryResult.data!['characters']['results']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}