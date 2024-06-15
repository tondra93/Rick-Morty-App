import 'package:graphql_flutter/graphql_flutter.dart';
import '../models/character.dart';

class CharacterRepository {
  final GraphQLClient client;

  CharacterRepository({required this.client});

  Future<List<Character>> fetchCharacters(int page) async {
    const String query = r'''
      query ($page: Int!) {
        characters(page: $page) {
          results {
            id
            name
            status
            species
            type
            gender
            origin {
              name
            }
            location {
              name
            }
            image
            episode {
              name
            }
          }
        }
      }
    ''';

    final options = QueryOptions(
      document: gql(query),
      variables: {'page': page},
    );

    final result = await client.query(options);
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List charactersJson = result.data!['characters']['results'];
    print('Fetched characters: ${charactersJson.length}'); 
    return charactersJson.map((json) => Character.fromJson(json)).toList();
  }
}
