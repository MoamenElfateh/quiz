import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,
    required this.questionIndex,
    required this.isCorrectAnswer,
  });
  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container(
      width: 30.0,
      height: 30.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color:
            isCorrectAnswer
                ? const Color.fromARGB(255, 145, 199, 148)
                : const Color.fromARGB(255, 156, 50, 50),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Text(
        questionNumber.toString(),
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
