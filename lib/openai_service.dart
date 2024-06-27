import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz_app/models/quiz_question.dart';

class OpenAIService {
  final String _apiKey =
      '';
  final String _baseUrl = 'https://api.openai.com/v1/chat/completions';

  final questions = [];

  Future<QuizQuestion> generateQuizQuestion(String topic) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      },
      body: jsonEncode({
        'model': 'gpt-3.5-turbo',
        'messages': [
          {'role': 'system', 'content': 'You are a helpful assistant.'},
          {
            'role': 'user',
            'content': 'Generate a multiple choice quiz question on the topic: $topic. '
                'Provide the question followed by the correct answer and three incorrect answers. '
                'Format the response as: '
                '"Question: <question>? Correct answer: <correct_answer>. Incorrect answers: <incorrect_answer1>, <incorrect_answer2>, <incorrect_answer3>."'
          },
        ],
        'max_tokens': 150,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      if (data.containsKey('choices') && data['choices'].isNotEmpty) {
        String text = data['choices'][0]['message']['content'].trim();

        RegExp regex = RegExp(
            r'Question: (.+)\? Correct answer: (.+)\. Incorrect answers: (.+), (.+), (.+)\.');
        Match? match = regex.firstMatch(text);

        if (match != null && match.groupCount == 5) {
          String question = match.group(1)!.trim();
          String correctAnswer = match.group(2)!.trim();
          String incorrectAnswer1 = match.group(3)!.trim();
          String incorrectAnswer2 = match.group(4)!.trim();
          String incorrectAnswer3 = match.group(5)!.trim();

          List<String> answers = [
            correctAnswer,
            incorrectAnswer1,
            incorrectAnswer2,
            incorrectAnswer3
          ];
          
          QuizQuestion quizQuestion = QuizQuestion(question, answers);
          return quizQuestion;
        } else {
          throw Exception(
              'Failed to parse quiz question from response: ${response.body}');
        }
      } else {
        throw Exception(
            'Invalid response format from OpenAI: ${response.body}');
      }
    } else {
      throw Exception(
          'Failed to generate quiz question, status code: ${response.statusCode}, body: ${response.body}');
    }
  }
}
