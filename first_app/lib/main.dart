import 'package:first_app/gradient_contrainer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      home: Scaffold(
    // backgroundColor: Colors.indigo,
    body: GradientContainer(Colors.purple, Colors.pink),
  )));
}
