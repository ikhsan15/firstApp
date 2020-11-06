import 'package:flutter/material.dart';
// import 'package:p_mobile_kuliahku/views/landingpage.dart';
import 'package:p_mobile_kuliahku/views/pekanlima.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Pekanlima(),
    );
  }
}
