import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
          title: Center(
            child: SvgPicture.asset(
              'assets/vectors/vector_105_x2.svg',
              width: 150,
            ),
          ),
          backgroundColor: Color(0xFF191D29),
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'All Cast',
                style: GoogleFonts.getFont(
                  'Plus Jakarta Sans',
                  color:  Color(0xFF13D9E5),
                  height: 1.4,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<CastBloc, CastState>(
                builder: (context, state) {
                  if (state is CastLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is CastLoaded) {
                    return GridView.builder(
                      padding: const EdgeInsets.all(10.0),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: state.characters.length,
                      itemBuilder: (context, index) {
                        final character = state.characters[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CastDetailsScreen(character: character),
                              ),
                            );
                          },
                          child: Card(
                            color: Colors.transparent,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    character.image,
                                    height: 140,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    character.name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white),
              label: 'Cast',
            ),
          ],
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.white,
          onTap: (index) {
            // Handle navigation here
          },
        ),
        backgroundColor: Color(0xFF191D29), // Adjust background color if necessary
      ),
    );
  }
}