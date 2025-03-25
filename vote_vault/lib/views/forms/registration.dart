// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vote_vault/views/forms/login.dart';
// import 'package:vote_vault/views/screens/home_screen.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedValue;
  List<String> states = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal'
  ];

  bool _isPasswordVisible = false;
  final TextEditingController _passwordController = TextEditingController();

  DateTime? _selectedDate;
  int? _age;
  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
        _selectedDate = _picked;
        _calculateAge();
      });
    }
  }

  void _calculateAge() {
    final now = DateTime.now();
    final age = now.year - _selectedDate!.year;
    if (now.month < _selectedDate!.month ||
        (now.month == _selectedDate!.month && now.day < _selectedDate!.day)) {
      _age = age - 1;
    } else {
      _age = age;
    }
  }

  bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 110,
                  ),
                  child: Text(
                    'Registration Form.',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.outfit().fontFamily,
                      color: const Color(0xFF00a878),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 40,
                  ),
                  child: Container(
                    width: 500,
                    height: 630,
                    decoration: BoxDecoration(
                      color: Color(0xFF00a878),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF00a878),
                          blurRadius: 30,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        left: 20,
                        right: 20,
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              if (value.length == 10) {
                                return "Must have 10 characters";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: GoogleFonts.outfit().fontFamily,
                              ),
                              hintText: "Voter ID",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              fillColor:
                                  const Color.fromARGB(111, 103, 241, 202),
                              filled: true,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              if (value.length == 10) {
                                return "Must have 50 characters";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: GoogleFonts.outfit().fontFamily,
                              ),
                              hintText: "Full Name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              fillColor:
                                  const Color.fromARGB(111, 103, 241, 202),
                              filled: true,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              return null;
                            },
                            controller: _dateController,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: GoogleFonts.outfit().fontFamily,
                              ),
                              hintText: "Date Of Birth",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              fillColor:
                                  const Color.fromARGB(111, 103, 241, 202),
                              filled: true,
                            ),
                            readOnly: true,
                            onTap: () async {
                              await _selectDate();
                              if (_age != null && _age! < 18) {
                                setState(() {
                                  _dateController.clear();
                                });
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "You must be at least 18 years old.",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.outfit().fontFamily,
                                      ),
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (!isValidEmail(value!)) {
                                // Use a custom validation function
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: GoogleFonts.outfit().fontFamily,
                              ),
                              hintText: "Email(optional)",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              fillColor:
                                  const Color.fromARGB(111, 103, 241, 202),
                              filled: true,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              if (value.length == 10) {
                                return "Must have 10 characters";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: GoogleFonts.outfit().fontFamily,
                              ),
                              hintText: "Mobile No.",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              fillColor:
                                  const Color.fromARGB(111, 103, 241, 202),
                              filled: true,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                            height: 100,
                            child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              expands: true,
                              minLines: null,
                              maxLines: null,
                              textAlignVertical: TextAlignVertical
                                  .top, // Align text to the top
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: GoogleFonts.outfit().fontFamily,
                                ),
                                hintText: "Address",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                fillColor:
                                    const Color.fromARGB(111, 103, 241, 202),
                                filled: true,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          DropdownButtonFormField(
                            value: _selectedValue,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              fillColor:
                                  const Color.fromARGB(111, 103, 241, 202),
                              filled: true,
                            ),
                            hint: Text(
                              "State",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: GoogleFonts.outfit().fontFamily,
                              ),
                            ),
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontFamily: GoogleFonts.outfit().fontFamily,
                            ),
                            items: states.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !_isPasswordVisible,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter a value";
                              }

                              if (value.length < 6) {
                                return "Must have at least 6 characters";
                              }
                              return null;
                            },
                            obscuringCharacter: "*",
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontFamily: GoogleFonts.outfit().fontFamily,
                              ),
                              // prefixIcon: Icon(CupertinoIcons.home),
                              hintText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              fillColor:
                                  const Color.fromARGB(111, 103, 241, 202),
                              filled: true,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Iconsax.eye_slash
                                      : Iconsax.eye,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            obscureText: !_isPasswordVisible,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter a value";
                              } else if (value != _passwordController.text) {
                                return "Password does not match";
                              }
                              return null;
                            },
                            obscuringCharacter: "*",
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: GoogleFonts.outfit().fontFamily,
                              ),
                              // prefixIcon: Icon(CupertinoIcons.home),
                              hintText: "Confirm Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              fillColor:
                                  const Color.fromARGB(111, 103, 241, 202),
                              filled: true,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Iconsax.eye_slash
                                      : Iconsax.eye,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: const Color.fromARGB(255, 0, 168, 120),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      shadowColor: const Color.fromARGB(255, 0, 168, 120),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (context) => Login()));
                      }
                      // Navigator.push(
                      //     context,
                      //     CupertinoPageRoute(
                      //         builder: (context) => HomeScreen()));
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: GoogleFonts.outfit().fontFamily,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
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
