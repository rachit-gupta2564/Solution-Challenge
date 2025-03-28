import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'dart:async';

class QRCodeSection extends StatefulWidget {
  const QRCodeSection({super.key});

  @override
  State<QRCodeSection> createState() => _QRCodeSectionState();
}

class _QRCodeSectionState extends State<QRCodeSection> {
  late String qrData;
  Timer? _timer;
  bool isTokenValid = true; // Initial state: Token is valid
  int remainingTime = 300; // Token valid for 5 minutes (300 seconds)

  static const int tokenDuration = 300; // Duration in seconds

  @override
  void initState() {
    super.initState();
    _regenerateToken(); // Generate token on app load
  }

  // Generate a new QR token and reset timer
  void _regenerateToken() {
    Map<String, dynamic> newQRData = {
      'voterID': 'ABC7392346',
      'name' : 'RACHIT GUPTA',
      'timestamp': DateTime.now().toIso8601String(),
      'boothID': '27',
      'tokenID': 'TOKEN${DateTime.now().millisecondsSinceEpoch}'
    };

    setState(() {
      qrData = newQRData.toString();
      isTokenValid = true;
      remainingTime = tokenDuration; // Reset countdown
    });

    // Restart the countdown timer after regeneration
    _startTokenTimer();
  }

  // Start countdown and expire the token after duration
  void _startTokenTimer() {
    _timer?.cancel(); // Safely cancel if _timer is not null
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        setState(() {
          isTokenValid = false;
        });
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel timer when widget is disposed
    super.dispose();
  }

  // Convert seconds to MM:SS format
  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 0),
        padding: const EdgeInsets.all(20),
        child: BlurryContainer(
          blur: 20,
          width: double.infinity,
          height: 436,
          elevation: 16,
          borderRadius: BorderRadius.circular(25),
          color: const Color.fromARGB(255, 12, 158, 255).withAlpha(38), // 0.15 * 255 = 38
          padding: const EdgeInsets.all(24),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.withAlpha(51), // 0.2 * 255 = 51
                  Colors.purple.withAlpha(76), // 0.3 * 255 = 76
                  Colors.pink.withAlpha(51),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withAlpha(64), // 0.25 * 255 = 64
                  blurRadius: 12,
                  spreadRadius: 3,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Your Voting Token',
                    style: GoogleFonts.outfit(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withAlpha(76), // 0.3 * 255 = 76
                        Colors.white.withAlpha(38), // 0.15 * 255 = 38
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: isTokenValid
                      ? QrImageView(
                          data: qrData,
                          version: QrVersions.auto,
                          size: 200,
                          gapless: false,
                          backgroundColor: Colors.white.withAlpha(230), // 0.9 * 255 = 230
                        )
                      : Container(
                          height: 200,
                          width: 200,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.red.withAlpha(26), // 0.1 * 255 = 26
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            'Token Expired ❌\nPlease Regenerate',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.outfit().fontFamily,
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 16),
                if (isTokenValid)
                  Text(
                    'Time Remaining: ${_formatTime(remainingTime)}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: remainingTime > 120
                          ? Colors.greenAccent // Above 2 mins: Green
                          : remainingTime > 30
                              ? const Color.fromARGB(255, 240, 85, 23) // Between 30 sec to 2 min: Orange
                              : Colors.redAccent,
                      fontFamily: GoogleFonts.outfit().fontFamily, // Below 30 sec: Red
                    ),
                  ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isTokenValid
                        ? const Color(0xFF1E88E5)
                        : Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 4,
                    shadowColor: Colors.blue.withAlpha(102), // 0.4 * 255 = 102
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  onPressed: _regenerateToken,
                  icon: const Icon(Icons.refresh, color: Colors.white),
                  label: Text(
                    isTokenValid ? 'Regenerate Token' : 'Generate New Token',
                    style: TextStyle(color: Colors.white, fontSize: 16,
                    fontFamily: GoogleFonts.outfit().fontFamily),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
