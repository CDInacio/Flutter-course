import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenSwers});

  final List<String> chosenSwers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenSwers.length; i++) {
      summary.add({
        'question_id': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenSwers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['uesr_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions corectly!'),
          const SizedBox(
            height: 30,
          ),
          QuestionsSummary(summaryData: summaryData),
          const SizedBox(
            height: 30,
          ),
          TextButton(onPressed: () {}, child: Text('Restart Quiz!')),
        ]),
      ),
    );
  }
}
