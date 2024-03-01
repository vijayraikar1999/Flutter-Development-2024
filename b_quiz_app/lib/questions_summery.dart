import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummery extends StatelessWidget {
  final List<Map<String, Object>> summeryData;

  const QuestionSummery({
    super.key,
    required this.summeryData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: summeryData
              .map(
                (data) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7.0),
                        margin: const EdgeInsets.only(right: 12.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0XD07292FF),
                        ),
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5.0),
                            Text(
                              data['question'] as String,
                              style: GoogleFonts.lato(
                                fontSize: 14.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            AnswersText(
                              text: 'Your answer : ',
                              answer: data['user_answer'].toString(),
                              color: Colors.blueAccent,
                            ),
                            AnswersText(
                              text: 'Correct Answer : ',
                              answer: data['correct_answer'].toString(),
                              color: Colors.teal,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class AnswersText extends StatelessWidget {
  final String text;
  final String answer;
  final Color color;
  const AnswersText({
    super.key,
    required this.text,
    required this.answer,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.white54,
          ),
        ),
        Expanded(
          child: Text(
            answer,
            style: TextStyle(
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
