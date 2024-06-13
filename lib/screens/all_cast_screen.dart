// lib/screens/all_cast_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ricky_morti/blocs/cast_bloc.dart';
import 'package:ricky_morti/blocs/cast_event.dart';
import 'package:ricky_morti/blocs/cast_state.dart';
import 'package:ricky_morti/screens/cast_details.dart';
import '../repositories/character_repository.dart';


class AllCastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final client = GraphQLProvider.of(context).value;
    final characterRepository = CharacterRepository(client: client);

    return BlocProvider(
      create: (context) => CastBloc(characterRepository)..add(FetchCharacters(1)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('All Cast'),
        ),
        body: BlocBuilder<CastBloc, CastState>(
          builder: (context, state) {
            if (state is CastLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CastLoaded) {
              return ListView.builder(
                itemCount: state.characters.length,
                itemBuilder: (context, index) {
                  final character = state.characters[index];
                  return ListTile(
                    leading: Image.network(character.image),
                    title: Text(character.name),
                    subtitle: Text(character.species),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CastDetailsScreen(character: character),
                        ),
                      );
                    },
                  );
                },
              );
            } else if (state is CastError) {
              return Center(child: Text(state.message));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
