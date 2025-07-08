import 'package:flutter/material.dart';
import 'package:loto_mks/models/toolbar_button.dart';

class FloatingToolbar extends StatelessWidget {
  final List<ToolbarButtonData> buttons;

  const FloatingToolbar({
    required this.buttons,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: buttons.map((buttonData) {
              return IconButton(
                padding: EdgeInsets.all(8),
                iconSize: 30,
                icon: Icon(buttonData.icon),
                color: buttonData.color,
                onPressed: buttonData.onPressed,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
