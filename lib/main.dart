import 'package:flutter/material.dart';
import 'telainicialquiz.dart'; 


void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TelaInicial(),
    );
  }
}


