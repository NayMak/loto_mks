import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  final bool disable;

  const CircleButton({
    required this.icon,
    required this.onPressed,
    this.disable = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disable ? null : onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 5,
        shadowColor: Colors.black.withValues(alpha: 0.5),
        shape: CircleBorder(),
        padding: EdgeInsets.all(24),
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        disabledBackgroundColor: Colors.grey.shade300,
        disabledForegroundColor: Colors.white,
      ),
      child: FaIcon(
        icon,
        size: 32,
        color: disable ? Colors.grey : Colors.white,
      ),
    );
  }
}
