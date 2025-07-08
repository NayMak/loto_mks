import 'package:flutter/material.dart';

class ToolbarButtonData {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? color;

  ToolbarButtonData({
    required this.icon,
    required this.onPressed,
    this.color,
  });
}
