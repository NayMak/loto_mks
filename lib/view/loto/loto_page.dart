import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loto_mks/provider/loto_provider.dart';
import 'package:loto_mks/view/loto/circle_button.dart';
import 'package:provider/provider.dart';

class LotoPage extends StatefulWidget {
  const LotoPage({super.key});

  @override
  State<LotoPage> createState() => _LotoPageState();
}

class _LotoPageState extends State<LotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: ChangeNotifierProvider.value(
        value: LotoProvider(),
        child: Consumer<LotoProvider>(
          builder: (BuildContext context, provider, Widget? child) {
            return Center(
              child: Column(
                children: [
                  Text(
                    'JEU DU BINGO !',
                    style: TextStyle(
                      fontSize: 96,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      shadows: [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Colors.black.withValues(red: 0.5),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey.withValues(alpha: 0.3),
                    thickness: 2,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        spacing: 16,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: provider.currentCard == null
                                  ? Center(
                                      child: Text(
                                        'Lancer le jeu et tirer une carte pour commencer',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          shadows: [
                                            Shadow(
                                              offset: Offset(1, 1),
                                              blurRadius: 1.0,
                                              color: Colors.black
                                                  .withValues(alpha: 0.1),
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Visibility(
                                visible: !provider.isGameStarted,
                                child: CircleButton(
                                  icon: FontAwesomeIcons.circlePlay,
                                  onPressed: () {
                                    provider
                                      ..init()
                                      ..startGame()
                                      ..selectRandomCard();
                                  },
                                ),
                              ),
                              Visibility(
                                visible: provider.isGameStarted,
                                child: CircleButton(
                                  icon: FontAwesomeIcons.fileArrowUp,
                                  onPressed: () {
                                    provider.selectRandomCard();
                                  },
                                ),
                              ),
                              SizedBox(height: 16),
                              Visibility(
                                visible: provider.isGameStarted,
                                child: CircleButton(
                                  icon: FontAwesomeIcons.arrowRotateRight,
                                  onPressed: () {
                                    provider
                                      ..init()
                                      ..startGame()
                                      ..isGameStarted = false;
                                  },
                                ),
                              ),
                              Visibility(
                                visible: !provider.isGameStarted,
                                child: CircleButton(
                                  icon: FontAwesomeIcons.arrowLeft,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
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
                        ],
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
