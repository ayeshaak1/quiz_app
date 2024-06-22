import 'package:flutter/material.dart';

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
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/quiz_logo.png',
                  width: 250,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    'Quiz App',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromRGBO(6, 115, 103, 1),
                      textStyle: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    child: const Text('Start Quiz'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
