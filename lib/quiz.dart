import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/results_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];
  var _activeScreen = 'start-screen';

  void _switchScreen() {
    setState(() {
      _activeScreen = 'question-screen';
    });
  }

  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      _activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(startQuiz: _switchScreen);

    if (_activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: _chooseAnswer);
    }

    if (_activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
        onRestartQuiz: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 17, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}









//render content conditionally and lifting state up:
//1-basic way using initState:
// Widget? activeScreen;
//   @override
//   void initState() {
//     super.initState();
//     activeScreen = StartScreen(startQuiz: switchScreen);
//   }
//   void switchScreen() {
//     setState(() {
//       activeScreen = QuestionsScreen();
//     });
//   }

//inside Build method 
// child : activeScreen ,

// ----------------------------------------

//2-use ternary operators 
// activeScreen == 'start-screen'
// void switchScreen () {
// setState((){
// activeScreen == 'question-screen';
// });
// }

//inside Build method
// child: activeScreen == 'start-screen' 
//  ? StartScreen (startQuiz: switchScreen) 
// : QuestionsScreen() ,

// ----------------------------------------

//3-use if statement
// var activeScreen = 'start-screen';
// void switchScreen() {
//   setState(() {
//     activeScreen = 'question-screen';
//   });
// }

//inside Build method 
// Widget screenWidget == StartScreen(switchScreen);
// if (screenWidget=='question-screen'){
// screenWidget=  QuestionScreen();}
// child : screenWidget , 