import 'package:flutter/material.dart';
import 'package:quiz/start_screen.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 104, 64, 173),
                Color.fromARGB(255, 72, 29, 148)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: const StartScreen()))));
}
