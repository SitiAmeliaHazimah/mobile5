import 'package:flutter/material.dart';
import 'package:wisata_mobile_5/materimodulscreens/formscreen6.dart';
import 'package:wisata_mobile_5/screens/splashscreen.dart';

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormScreen6(),
    );
  }
}
