import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loto_mks/provider/loto_provider.dart';
import 'package:loto_mks/theme/theme_colors.dart';
import 'package:provider/provider.dart';

class BingoModal extends StatefulWidget {
  final String title;
  final String? subtitle;

  const BingoModal({
    required this.title,
    super.key,
    this.subtitle,
  });

  @override
  State<BingoModal> createState() => _BingoModalState();
}

class _BingoModalState extends State<BingoModal> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LotoProvider>(
      builder: (context, provider, child) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: ThemeColors.accent,
          title: Text(
            widget.title,
            style: GoogleFonts.luckiestGuy(
              fontSize: 20,
              color: ThemeColors.primary,
            ),
          ),
          content: Text(
            widget.subtitle ?? '',
            style: GoogleFonts.luckiestGuy(
              fontSize: 20,
              color: ThemeColors.primary,
            ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: ThemeColors.darkGray,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Non',
                style: GoogleFonts.luckiestGuy(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: ThemeColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Oui',
                style: GoogleFonts.luckiestGuy(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                provider.init();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
