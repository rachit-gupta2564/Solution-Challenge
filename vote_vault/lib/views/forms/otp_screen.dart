import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'OTP',
          style: TextStyle(
            color: const Color.fromRGBO(0, 0, 0, 1),
            fontSize: 28,
            fontWeight: FontWeight.w500,
            fontFamily: GoogleFonts.outfit().fontFamily,
            letterSpacing: 6,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 48,
              bottom: 24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/otp.png',
                  width: 250,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
