import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown,
        appBar: AppBar(
          backgroundColor: Colors.brown[900],
          centerTitle: true,
          title: const Text(
            'I am Poor',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Image.asset('images/money.png'),
        ),
      ),
    ),
  );
}
