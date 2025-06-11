import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  final bool disable;
  final Color? backgroundColor;

  const FloatingButton({
    required this.icon,
    required this.onPressed,
    this.disable = false,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: IconButton(
        padding: EdgeInsets.all(8),
        iconSize: 30,
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }
}
