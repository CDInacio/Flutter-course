import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.text, required this.onTouch});

  final String text;
  final void Function() onTouch;

  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: onTouch,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 33, 1, 95),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: Text(
          text,
          textAlign: TextAlign.center,
        ));
  }
}
