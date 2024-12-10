import 'package:flutter/material.dart';
import 'package:loto_mks/view/loto/loto_page.dart';

void main() {
  runApp(const LotoApp());
}

class LotoApp extends StatelessWidget {
  const LotoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const LotoPage(),
    );
  }
}
