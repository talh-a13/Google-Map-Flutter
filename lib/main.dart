import 'package:flutter/material.dart';
import 'package:flutter_google_maps/google_place_api.dart';
import 'package:flutter_google_maps/homescreen.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home:googlepplaceapi() );
  }
}
