import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/character.dart';

class CastDetailsScreen extends StatelessWidget {
  final Character character;

  static const IconData arrow_back_ios_outlined = IconData(0xee84, fontFamily: 'MaterialIcons', matchTextDirection: true);

  const CastDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(arrow_back_ios_outlined, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: SvgPicture.asset(
          'assets/vectors/rick_and_morti.svg',
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
                child: CachedNetworkImage(
                  imageUrl: character.image,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: _buildDetailCard('assets/vectors/status.svg', 'Status', character.status),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildDetailCard('assets/vectors/species.svg', 'Species', character.species),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildDetailCard('assets/vectors/gender.svg', 'Gender', character.gender),
                  ),
                ],
              ),
              SizedBox(height: 10),
              _buildWideDetailCard('assets/vectors/origin.svg', 'Origin', character.origin.name),
              SizedBox(height: 10),
              _buildWideDetailCard('assets/vectors/location.svg', 'Last Known Location', character.location.name),
              SizedBox(height: 20),
              _buildWideEpisodesCard('assets/vectors/episode.svg', character.episode),
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

  Widget _buildDetailCard(String svgPath, String label, String value) {
    return Card(
      color: Color(0xFF1E2430),
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SvgPicture.asset(svgPath, color: Colors.green, height: 24, width: 24),
            SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 3),
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWideDetailCard(String svgPath, String label, String value) {
    return Container(
      width: double.infinity,
      child: Card(
        color: Color(0xFF1E2430),
        margin: EdgeInsets.symmetric(vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(svgPath, color: Colors.green, height: 24, width: 24),
              SizedBox(height: 5),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWideEpisodesCard(String svgPath, List<Episode> episodes) {
    String title = episodes.length == 1 ? 'Episode' : 'Episodes';
    
    return Container(
      width: double.infinity,
      child: Card(
        color: Color(0xFF1E2430),
        margin: EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(svgPath, color: Colors.green, height: 24, width: 24),
              SizedBox(height: 5),
              Text(
                title,
                style: GoogleFonts.getFont(
                  'Roboto Condensed',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              ...episodes.map((e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Text(
                  e.name,
                  style: TextStyle(color: Colors.white),
                ),
              )).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
