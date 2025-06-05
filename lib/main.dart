import 'package:flutter/material.dart';
import 'package:loto_mks/view/home/home_page.dart';

void main() {
  runApp(const LotoApp());
}

class LotoApp extends StatelessWidget {
  const LotoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bingo MKS',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
