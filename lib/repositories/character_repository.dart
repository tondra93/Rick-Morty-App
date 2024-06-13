import 'package:graphql_flutter/graphql_flutter.dart';
import '../models/character.dart';

class CharacterRepository {
  final GraphQLClient client;

  CharacterRepository({required this.client});

  Future<List<Character>> fetchCharacters(int page) async {
    const String query = '''
      query GetCharacters(\$page: Int) {
        characters(page: \$page) {
          results {
            id
            name
            status
            species
            gender
            image
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

    final List charactersJson = result.data?['characters']['results'];
    return charactersJson.map((json) => Character.fromJson(json)).toList();
  }
}
