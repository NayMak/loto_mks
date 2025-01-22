import 'package:flutter/material.dart';
import 'package:loto_mks/provider/loto_provider.dart';
import 'package:provider/provider.dart';

class Modal extends StatefulWidget {
  final String title;
  final String? subtitle;

  const Modal({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  State<Modal> createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LotoProvider>(
        builder: (BuildContext context, provider, Widget? child) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: Colors.tealAccent,
        title: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        content: Text(
          widget.subtitle ?? '',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        actions: [
          TextButton(
            child: Text(
              'Non',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: Text(
              'Oui',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onPressed: () {
              provider
                ..init()
                ..startGame()
                ..isGameStarted = false;
              Navigator.pop(context);
            },
          ),
        ],
      );
    });
  }
}
