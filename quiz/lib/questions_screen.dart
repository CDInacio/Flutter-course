import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onChooseAnswer});

  final void Function(String answer) onChooseAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var questionId = 0;

  void answerQuestion(String selectedAnswer) {
    // widget gives access to the widget's class properties above
    widget.onChooseAnswer(selectedAnswer);
    setState(() {
      questionId += 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[questionId];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.text,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 201, 153, 251),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              ...currentQuestion.getShuffledAnswers().map((answer) {
                return AnswerButton(
                    text: answer, onTouch: () => answerQuestion(answer));
              }),
            ]),
      ),
    );
  }
}
