import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vote_vault/views/forms/otp_screen.dart';
import 'package:vote_vault/views/home_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _voterID;
  late TextEditingController _pass;
  late TextEditingController _phone;

  bool _validate = false;
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _voterID = TextEditingController();
    _pass = TextEditingController();
    _phone = TextEditingController();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _voterID.dispose();
    _pass.dispose();
    _phone.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Color(0xFF00a878)),
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 16,
                  bottom: 8,
                ),
                child: Text(
                  'Login Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1f487e),
                    fontFamily: GoogleFonts.outfit().fontFamily,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              bottom: 60,
            ),
            child: Row(
              children: [
                Text(
                  'Hello welcome back to Vote Vault',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 139, 139, 138),
                    fontFamily: GoogleFonts.outfit().fontFamily,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 240, 237, 237),
                          Color.fromARGB(255, 245, 244, 243),
                          Color.fromARGB(255, 245, 245, 241),
                          Color.fromARGB(255, 248, 248, 245),
                        ],
                        transform: GradientRotation(4),
                      ),
                      borderRadius: BorderRadius.circular(70),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                      ),
                      child: TabBar(
                        dividerColor: Colors.transparent,
                        tabs: <Widget>[
                          Tab(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50.0,
                                vertical: 0,
                              ),
                              child: Text("Voter ID",
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.outfit().fontFamily,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                          ),
                          Tab(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32.0,
                                vertical: 0,
                              ),
                              child: Text(
                                'Phone Number',
                                style: TextStyle(
                                  fontFamily: GoogleFonts.outfit().fontFamily,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                        ],
                        splashBorderRadius: BorderRadius.circular(20),
                        controller: _tabController,
                        indicator: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 170, 170, 168),
                              blurRadius: 10,
                              offset: Offset(2, 0),
                              spreadRadius: 2,
                            ),
                          ],
                          shape: BoxShape.rectangle,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        labelColor: Colors.black,
                        unselectedLabelStyle: TextStyle(
                          color: Color.fromARGB(255, 184, 182, 182),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                _buildVoterIDForm(),
                _buildPhoneNoForm(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildVoterIDForm() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 8,
            left: 20,
          ),
          child: Row(
            children: [
              Text(
                'Login using Voter ID',
                style: TextStyle(
                  fontSize: 18,
                  color: const Color(0xFF1f487e),
                  fontFamily: GoogleFonts.outfit().fontFamily,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 48,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Container(
            width: 500,
            // height: 174,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            decoration: BoxDecoration(
                color: const Color(0xFF407aff),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 0, 168, 168),
                    blurRadius: 10,
                    offset: Offset(0, 0),
                    spreadRadius: 2,
                  ),
                ]),
            child: Column(
              children: [
                TextField(
                  controller: _voterID,
                  decoration: InputDecoration(
                    hintText: 'Voter ID',
                    errorText: _validate ? 'This field is required' : null,
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: GoogleFonts.outfit().fontFamily,
                    ),
                    contentPadding: EdgeInsets.only(
                      left: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(150, 41, 221, 245),
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                TextField(
                  obscureText: !_isPasswordVisible,
                  controller: _pass,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    errorText: _validate ? 'This field is required' : null,
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: GoogleFonts.outfit().fontFamily,
                    ),
                    contentPadding: EdgeInsets.only(
                      left: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(150, 41, 221, 245),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        _isPasswordVisible ? Iconsax.eye_slash : Iconsax.eye,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 44,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _voterID.text.isEmpty || _pass.text.isEmpty
                      ? _validate = true
                      : _validate = false;
                });
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
                elevation: WidgetStateProperty.all<double>(4),
                backgroundColor: WidgetStateProperty.all<Color>(
                  const Color.fromARGB(255, 65, 122, 255),
                ),
                foregroundColor: WidgetStateProperty.all<Color>(
                  Colors.white,
                ),
                padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                ),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: GoogleFonts.outfit().fontFamily,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildPhoneNoForm() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 8,
            left: 20,
          ),
          child: Row(
            children: [
              Text(
                'Login using Phone Number',
                style: TextStyle(
                  fontSize: 18,
                  color: const Color(0xFF1f487e),
                  fontFamily: GoogleFonts.outfit().fontFamily,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 48,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 0, 168, 168),
                    blurRadius: 10,
                    offset: Offset(0, 0),
                    spreadRadius: 2,
                  )
                ]),
            child: Column(
              children: [
                TextField(
                  cursorColor: Color.fromARGB(255, 255, 255, 255),
                  controller: _phone,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    errorText: _validate
                        ? (_phone.text.isEmpty
                            ? 'Phone number is required'
                            : (_phone.text.length < 10
                                ? 'Phone number must be 10 digits'
                                : (_phone.text.length > 10
                                    ? 'Phone number cannot exceed 10 digits'
                                    : null)))
                        : null,
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: GoogleFonts.outfit().fontFamily,
                    ),
                    contentPadding: EdgeInsets.only(
                      left: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(149, 19, 139, 238),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 44,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _validate = _phone.text.isEmpty ||
                          _phone.text.length < 10 ||
                          _phone.text.length > 10;
                    });
                    if (!_validate) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTPScreen(
                            phone: _phone.text,
                          ),
                        ),
                      );
                    }
                  },
                  style: ButtonStyle(
                    elevation: WidgetStateProperty.all<double>(4),
                    backgroundColor: WidgetStateProperty.all<Color>(
                      const Color.fromARGB(255, 65, 122, 255),
                    ),
                    foregroundColor: WidgetStateProperty.all<Color>(
                      Colors.white,
                    ),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 10,
                      ),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  child: Text(
                    'Request OTP',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: GoogleFonts.outfit().fontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
