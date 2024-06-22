import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(173, 20, 87, 1),
                Color.fromRGBO(244, 94, 159, 1),
                Color.fromRGBO(255, 145, 193, 1),
                Color.fromRGBO(244, 94, 159, 1),
                Color.fromRGBO(173, 20, 87, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
          ),
          child: const Center(
            child: Text(
              'Quiz App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
