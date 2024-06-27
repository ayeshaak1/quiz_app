import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/openai_service.dart';
import 'package:quiz_app/models/quiz_question.dart';
import 'package:quiz_app/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  static List<QuizQuestion> quizSummary = [];

  static List<QuizQuestion> get getQuizSummary => quizSummary; 

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final OpenAIService openAIService = OpenAIService();

  QuizQuestion? _currentQuestion;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _fetchQuestion();
  }

  Future<void> _fetchQuestion() async {
    if (mounted) {
      setState(() {
        _loading = true;
      });
    }

    try {
      final QuizQuestion data = await openAIService.generateQuizQuestion('UFC');
      QuestionsScreen.quizSummary.add(data);
      if (mounted) {
        setState(() {
          _currentQuestion = data;
          _loading = false;
        });
      }
    } catch (e) {
      print(e);
      if (mounted) {
        setState(() {
          _currentQuestion = null;
          _loading = false;
        });
      }
    }
  }

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    _fetchQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : _currentQuestion == null
                ? const Center(child: Text('Failed to load question'))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _currentQuestion!.text,
                        style: GoogleFonts.quicksand(
                          color: const Color.fromRGBO(0, 90, 79, 1),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      ..._currentQuestion!.answers.map((item) {
                        return Padding(
                          padding: const EdgeInsets.all(4),
                          child: AnswerButton(
                            item,
                            () {
                              answerQuestion(item);
                            },
                          ),
                        );
                      }),
                    ],
                  ),
      ),
    );
  }
}
