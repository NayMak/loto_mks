import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:loto_mks/provider/loto_provider.dart';
import 'package:loto_mks/view/loto/circle_button.dart';
import 'package:provider/provider.dart';

class BingoButton extends StatelessWidget {
  const BingoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.redAccent,
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
        child: Consumer<LotoProvider>(
          builder: (context, provider, Widget? child) {
            return IconButton(
              iconSize: 30,
              icon: Icon(FontAwesomeIcons.b),
              color: Colors.white,
              onPressed: () {
                if (provider.isSoundOn) {
                  provider.player = AudioPlayer()
                    ..setUrl('assets/audio/bingo_win.mp3');
                }
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    if (provider.isSoundOn) {
                      provider.player!.play();
                    }
                    return AlertDialog(
                      backgroundColor: Colors.transparent,
                      content: Column(
                        children: [
                          Image.asset(
                            'assets/bingo/bingo.png',
                          ),
                          CircleButton(
                            icon: FontAwesomeIcons.house,
                            onPressed: () {
                              if (provider.isSoundOn) {
                                provider.player!.stop();
                              }
                              Navigator.popUntil(
                                context,
                                (route) => route.isFirst,
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
