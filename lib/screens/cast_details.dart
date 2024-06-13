import 'package:flutter/material.dart';
import '../models/character.dart';

class CastDetailsScreen extends StatelessWidget {
  final Character character;

  const CastDetailsScreen({required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(character.image),
            ),
            SizedBox(height: 16),
            Text('Name: ${character.name}', style: TextStyle(fontSize: 20)),
            Text('Status: ${character.status}', style: TextStyle(fontSize: 20)),
            Text('Species: ${character.species}', style: TextStyle(fontSize: 20)),
            Text('Gender: ${character.gender}', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
