import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/character.dart';

class CastDetailsScreen extends StatelessWidget {
  final Character character;

  const CastDetailsScreen({required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: SvgPicture.asset(
          'assets/vectors/vector_105_x2.svg',
          width: 200,
          height: 50,
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF191D29),
        elevation: 0,
      ),
      body: Container(
        color: Color(0xFF191D29),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                character.name,
                style: GoogleFonts.getFont(
                  'Plus Jakarta Sans',
                  fontSize: 22,
                  height: 1.3,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF13D9E5),
                ),
              ),
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  character.image,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              _buildDetailCard(Icons.favorite, 'Status', character.status),
              _buildDetailCard(Icons.person, 'Species', character.species),
              _buildDetailCard(Icons.transgender, 'Gender', character.gender),
              _buildDetailCard(Icons.public, 'Origin', character.origin.name),
              _buildDetailCard(Icons.location_on, 'Last Known Location', character.location.name),
              SizedBox(height: 20),
              _buildEpisodesCard(character.episode),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF191D29),
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
        currentIndex: 1,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
      ),
    );
  }

  Widget _buildDetailCard(IconData icon, String label, String value) {
    return Card(
      color: Color(0xFF1E2430),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildEpisodesCard(List<Episode> episodes) {
    return Card(
      color: Color(0xFF1E2430),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Episodes',
              style: GoogleFonts.getFont(
                'Roboto Condensed',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            ...episodes.map((e) => Text(
              e.name,
              style: TextStyle(color: Colors.white),
            )).toList(),
          ],
        ),
      ),
    );
  }
}
