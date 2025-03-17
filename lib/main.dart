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
      title: 'Loto MKS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const HomePage(),
    );
  }
}
