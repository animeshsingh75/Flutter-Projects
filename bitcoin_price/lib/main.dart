import 'package:flutter/material.dart';

import 'price_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.lightBlue,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
            ),
            centerTitle: true,
          ),
          scaffoldBackgroundColor: Colors.white),
      home: const PriceScreen(),
    );
  }
}
