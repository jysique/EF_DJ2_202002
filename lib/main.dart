import 'package:flutter/material.dart';
import 'package:flutter_final_exam/features/home_screen.dart';

void main() {
  runApp(new MaterialApp(
    theme: new ThemeData(
        primaryColor: Colors.white
    ),
    home: HomeScreen(),
  ));
}