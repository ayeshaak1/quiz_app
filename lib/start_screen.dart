import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
