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
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: CircleBorder(),
        padding: EdgeInsets.all(24),
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.white,
      ),
      child: FaIcon(
        icon,
        size: 32,
      ),
    );
  }
}
