import 'package:b_quiz_app/data/questions.dart';
import 'package:b_quiz_app/questions_summery.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.restartQuiz,
  });

  List<Map<String, Object>> getSummeryData() {
    final List<Map<String, Object>> summery = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summery.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].options[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }
    return summery;
  }

  @override
  Widget build(BuildContext context) {
    final summeryData = getSummeryData();
    final numTotalQuestion = questions.length;
    final numCorrectQuestions = summeryData
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestion questions correctly',
              style: GoogleFonts.lato(
                fontSize: 18.0,
                color: Colors.white60,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30.0),
            QuestionSummery(summeryData: summeryData),
            const SizedBox(height: 30.0),
            TextButton(
              onPressed: restartQuiz,
              child: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
