import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  final Map<String, Object> itemData;

  const SummaryItem({super.key, required this.itemData});

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            questionIndex: itemData['question_index'] as int,
            isCorrectAnswer: isCorrectAnswer,
          ),
          SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (itemData['question']).toString(),
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  (itemData['user_answer']).toString(),
                  style: TextStyle(color: Color.fromARGB(255, 202, 171, 252)),
                ),
                SizedBox(height: 5.0),
                Text(
                  (itemData['correct_answer']).toString(),
                  style: TextStyle(color: Color.fromARGB(255, 181, 254, 246)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
