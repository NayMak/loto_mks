import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loto_mks/components/modal.dart';
import 'package:loto_mks/provider/loto_provider.dart';
import 'package:loto_mks/view/loto/circle_button.dart';
import 'package:provider/provider.dart';
import 'package:just_audio/just_audio.dart';

class LotoPage extends StatefulWidget {
  const LotoPage({super.key});

  @override
  State<LotoPage> createState() => _LotoPageState();
}

class _LotoPageState extends State<LotoPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LotoProvider>(
      create: (_) => LotoProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'JEU DU BINGO !',
            style: TextStyle(
              fontSize: 24,
              color: Color(0xFF1A237E),
              shadows: [
                Shadow(
                  color: Colors.black.withBlue(1),
                  offset: Offset(1, 1),
                  blurRadius: 2,
                ),
              ],
            ),
          ),
          backgroundColor: Color(0xFFCFD8DC),
          centerTitle: true,
        ),
        body: Consumer<LotoProvider>(
          builder: (context, provider, Widget? child) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFCFD8DC),
                    Color(0xFF455A64),
                    Color(0xFF263238),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      spacing: 16,
                      children: [
                        Expanded(
                          child: Card(
                            color: Color(0xFFECEFF1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 4,
                            child: provider.currentCard == null
                                ? Center(
                                    child: Text(
                                      'Lancer le jeu pour commencer à tirer les cartes',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFF1A237E),
                                        shadows: [
                                          Shadow(
                                            color: Colors.black.withBlue(1),
                                            offset: Offset(1, 1),
                                            blurRadius: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Image(
                                        image: AssetImage(
                                          provider.currentCard!.asset,
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            color: Color(0xFFECEFF1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleButton(
                                        icon: FontAwesomeIcons.tableCellsLarge,
                                        onPressed: () {
                                          provider.updateGridViewAxisCount(3);
                                        },
                                        disable:
                                            provider.gridViewAxisCount == 3,
                                      ),
                                      SizedBox(width: 16),
                                      CircleButton(
                                        icon: FontAwesomeIcons.tableCells,
                                        onPressed: () {
                                          provider.updateGridViewAxisCount(5);
                                        },
                                        disable:
                                            provider.gridViewAxisCount == 5,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  Expanded(
                                    child: GridView.count(
                                      primary: false,
                                      padding: const EdgeInsets.all(8),
                                      crossAxisSpacing: 4,
                                      mainAxisSpacing: 4,
                                      crossAxisCount:
                                          provider.gridViewAxisCount,
                                      children: [
                                        ...provider.announcedCards.map((card) {
                                          return Image(
                                            image: AssetImage(card.asset),
                                          );
                                        }),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.9),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (!provider.isGameStarted) ...[
                              IconButton(
                                iconSize: 30,
                                icon: Icon(FontAwesomeIcons.circlePlay),
                                onPressed: () {
                                  provider
                                    ..init()
                                    ..startGame()
                                    ..selectRandomCard();
                                },
                              ),
                              IconButton(
                                iconSize: 30,
                                icon: Icon(FontAwesomeIcons.arrowLeft),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ] else ...[
                              IconButton(
                                iconSize: 30,
                                icon: Icon(FontAwesomeIcons.fileArrowUp),
                                onPressed: () => provider.selectRandomCard(),
                              ),
                              IconButton(
                                iconSize: 30,
                                icon: Icon(FontAwesomeIcons.b),
                                color: Colors.redAccent,
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
                              ),
                              IconButton(
                                iconSize: 30,
                                icon: Icon(FontAwesomeIcons.arrowRotateRight),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        ChangeNotifierProvider.value(
                                      value: provider,
                                      child: Modal(
                                        title:
                                            'Souhaitez-vous démarrer une nouvelle partie ?',
                                        subtitle:
                                            'Les numéros tirées lors de la partie en cours seront réinitialisés.',
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
