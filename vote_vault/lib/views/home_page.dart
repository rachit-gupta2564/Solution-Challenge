import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vote_vault/views/qr_code_section.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Function to open Google Maps with polling booth location
  Future<void> _launchMapsUrl(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw 'Could not open the map.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Voter Verification',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: GoogleFonts.outfit().fontFamily,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 27, 111, 236),
        elevation: 12,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const QRCodeSection(),
            const SizedBox(height: 20),
            _buildVotingStatusCard(),
            const SizedBox(height: 20),
            _buildUpcomingElectionDetails(),
          ],
        ),
      ),
    );
  }

  // Voting Status Card UI
  Widget _buildVotingStatusCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.check_circle, color: Colors.green, size: 32),
        title: Text(
          'Voting Status',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: GoogleFonts.outfit().fontFamily),
        ),
        subtitle: Text('Verified and ready to vote', style: TextStyle(fontFamily: GoogleFonts.outfit().fontFamily,),),
      ),
    );
  }

  // Upcoming Election Details Card UI with Show on Map
  Widget _buildUpcomingElectionDetails() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
           ListTile(
            leading: Icon(Icons.event, color: Colors.blue, size: 32),
            title: Text(
              'Upcoming Elections',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: GoogleFonts.outfit().fontFamily),
            ),
            subtitle: Text('State Assembly Elections - April 2025', style: TextStyle(fontFamily: GoogleFonts.outfit().fontFamily),),
          ),
          // Show on Map Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _launchMapsUrl(
                    'https://www.google.com/maps/place/XYZ+Public+School,+New+Delhi',
                  ),
                  icon: const Icon(Iconsax.map5, color: Colors.white, size: 20,),
                  label: Text(
                    'Show on Map',
                    style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.outfit().fontFamily, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
