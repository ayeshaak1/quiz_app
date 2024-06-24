import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You answered x out of y questions correclty!',
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('List of answers and questions...'),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
