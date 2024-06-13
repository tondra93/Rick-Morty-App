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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  character.image,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              character.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildDetailRow(Icons.favorite, 'Status', character.status),
            SizedBox(height: 10),
            _buildDetailRow(Icons.person, 'Species', character.species),
            SizedBox(height: 10),
            _buildDetailRow(Icons.transgender, 'Gender', character.gender),
            SizedBox(height: 20),
            _buildDetailRow(Icons.public, 'Origin', character.origin.name),
            SizedBox(height: 10),
            _buildDetailRow(Icons.location_on, 'Last Known Location', character.location.name),
            SizedBox(height: 20),
            Text(
              'Episodes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ...character.episode.map((e) => Text(e.name)).toList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Cast',
          ),
        ],
        currentIndex: 1, // set to the second tab
        onTap: (index) {
          // Handle navigation based on the selected tab
        },
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.green),
        SizedBox(width: 10),
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 18),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
