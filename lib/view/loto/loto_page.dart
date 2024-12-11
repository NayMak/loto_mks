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
      body: ChangeNotifierProvider.value(
        value: LotoProvider(),
        child: Consumer<LotoProvider>(
          builder: (BuildContext context, provider, Widget? child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'JEU DU BINGO !',
                      style: TextStyle(
                        fontSize: 96,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: provider.currentCard == null
                                ? Center(child: const Text('Lancer le jeu et tirer une carte pour commencer'))
                                : Center(
                                    child: Image(
                                      image: AssetImage(
                                        provider.currentCard!.asset,
                                      ),
                                    ),
                                  ),
                          ),
                          SizedBox(width: 16),
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
                                      ..startGame();
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
                                      ..startGame();
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 16),
                          Expanded(
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
                                      disable: provider.gridViewAxisCount == 3,
                                    ),
                                    SizedBox(width: 16),
                                    CircleButton(
                                      icon: FontAwesomeIcons.tableCells,
                                      onPressed: () {
                                        provider.updateGridViewAxisCount(5);
                                      },
                                      disable: provider.gridViewAxisCount == 5,
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
                                    crossAxisCount: provider.gridViewAxisCount,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}