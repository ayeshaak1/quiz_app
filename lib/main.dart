import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(0, 90, 79, 1),
                Color.fromRGBO(57, 198, 182, 1),
                Color.fromRGBO(116, 228, 208, 1),
                Color.fromRGBO(57, 198, 182, 1),
                Color.fromRGBO(0, 90, 79, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
          ),
          child: const StartScreen(),
        ),
      ),
    ),
  );
}
