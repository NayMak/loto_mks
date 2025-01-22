import 'package:flutter/material.dart';
import 'package:loto_mks/provider/loto_provider.dart';
import 'package:loto_mks/view/home/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const LotoApp());
}

class LotoApp extends StatelessWidget {
  const LotoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LotoProvider>(
          create: (_) => LotoProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        home: const HomePage(),
      ),
    );
  }
}
