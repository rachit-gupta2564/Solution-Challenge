import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vote_vault/views/home_page.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  const OTPScreen({super.key, required this.phone}); //

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final double fixedRoundedVal = 20.0;
  late TextEditingController _fir;
  late TextEditingController _sec;
  late TextEditingController _thir;
  late TextEditingController _for;
  // ignore: unused_field
  bool _validate = false;

  void _validateOTP() {
    if (_fir.text.isEmpty ||
        _sec.text.isEmpty ||
        _thir.text.isEmpty ||
        _for.text.isEmpty) {
      setState(() {
        _validate = true;
      });
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please enter all OTP digits!',
            style: TextStyle(
              fontFamily: GoogleFonts.outfit().fontFamily,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      setState(() {
        _validate = false;
      });
      // Proceed if OTP is valid
      _submitOTP(); // Call the submission function
    }
  }

  void _submitOTP() {
    // Handle OTP submission logic here (e.g., API call or navigation)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'OTP Verified Successfully!',
          style: TextStyle(
            fontFamily: GoogleFonts.outfit().fontFamily,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  void initState() {
    _fir = TextEditingController();
    _sec = TextEditingController();
    _thir = TextEditingController();
    _for = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _fir.dispose();
    _sec.dispose();
    _thir.dispose();
    _for.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 48,
              bottom: 56,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/otp.png',
                  width: 280,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              'Verification code',
              style: TextStyle(
                fontSize: 28,
                fontFamily: GoogleFonts.outfit().fontFamily,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: const Color(0xFF00a878),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'We have sent a OTP verification code to\nYour Phone Number',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: GoogleFonts.outfit().fontFamily,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: const Color.fromARGB(255, 92, 92, 92)),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '+91 ${widget.phone}', // ✅ Show phone number here
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: GoogleFonts.outfit().fontFamily,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 56, 123, 247),
                          borderRadius: BorderRadius.circular(70),
                        ),
                        child: Icon(
                          Iconsax.edit_25,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextField(
                          cursorColor: Colors.white,
                          controller: _fir,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontFamily: GoogleFonts.outfit().fontFamily,
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(fixedRoundedVal),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 29, 108, 226),
                              ),
                              borderRadius:
                                  BorderRadius.circular(fixedRoundedVal),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 72, 140, 243),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextField(
                          cursorColor: Colors.white,
                          controller: _sec,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontFamily: GoogleFonts.outfit().fontFamily,
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(fixedRoundedVal),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 29, 108, 226),
                              ),
                              borderRadius:
                                  BorderRadius.circular(fixedRoundedVal),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 72, 140, 243),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextField(
                          cursorColor: Colors.white,
                          controller: _thir,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontFamily: GoogleFonts.outfit().fontFamily,
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(fixedRoundedVal),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 29, 108, 226),
                              ),
                              borderRadius:
                                  BorderRadius.circular(fixedRoundedVal),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 72, 140, 243),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextField(
                          cursorColor: Colors.white,
                          controller: _for,
                          onChanged: (value) {
                            if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontFamily: GoogleFonts.outfit().fontFamily,
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(fixedRoundedVal),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 29, 108, 226),
                              ),
                              borderRadius:
                                  BorderRadius.circular(fixedRoundedVal),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 72, 140, 243),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 72,
          ),
          //Submit Button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ElevatedButton(
                    onPressed: () {
                      _validateOTP();
                      if (!_validate) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          Color.fromARGB(255, 51, 97, 203)),
                      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(
                        vertical: 12,
                      )),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        letterSpacing: 1.6,
                        fontFamily: GoogleFonts.outfit().fontFamily,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
