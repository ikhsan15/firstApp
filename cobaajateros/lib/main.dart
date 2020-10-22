// import 'package:cobaajateros/views/loginpage.dart';
import 'package:cobaajateros/views/mainpage.dart';
import 'package:flutter/material.dart';
// import 'package:lit_firebase_auth/lit_firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}
