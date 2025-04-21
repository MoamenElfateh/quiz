import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.startQuiz});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300.0,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),

          const SizedBox(height: 80.0),

          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(color: Colors.white, fontSize: 24.0),
          ),

          const SizedBox(height: 30.0),

          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: TextStyle(fontSize: 25.0),
            ),
            icon: const Icon(Icons.arrow_right_alt, color: Colors.white),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
