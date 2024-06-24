import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz_logo.png',
            width: 250,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              'Quiz App',
              style: GoogleFonts.quicksand(
                color: Colors.white,
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: ElevatedButton.icon(
              onPressed: () {
                startQuiz();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromRGBO(6, 115, 103, 1),
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
              ),
              icon: const Icon(Icons.play_arrow_outlined),
              label: const Text('Start Quiz'),
            ),
          ),
        ],
      ),
    );
  }
}
