import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.deepOrange,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      title: 'Lista de Despesas',
      home: const HomePage(),
    );
  }
}
