import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/character.dart';

class CastDetailsScreen extends StatelessWidget {
  final Character character;

  const CastDetailsScreen({required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        color: Color(0xFF191D29), // Set the background color
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  character.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF13D9E5), // Change text color to the specified color
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Change text color to white for visibility
                ),
              ),
              SizedBox(height: 10),
              ...character.episode.map((e) => Text(
                e.name,
                style: TextStyle(color: Colors.white), // Change text color to white for visibility
              )).toList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF191D29), // Set background color for BottomNavigationBar
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
        selectedItemColor: Colors.green, // Set selected item color
        unselectedItemColor: Colors.white, // Set unselected item color
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
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Change text color to white for visibility
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white, // Change text color to white for visibility
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
