import 'package:flutter/material.dart';
import 'package:vote_vault/views/forms/login.dart'; 
// import 'package:vote_vault/views/forms/login.dart';
// import 'package:vote_vault/views/forms/otp_screen.dart';
// import 'package:vote_vault/views/forms/registration.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 32, 100, 247),
        useMaterial3: true,
        fontFamily: 'Outfit',
      ),
      home: Login(),
    );
  }
}
