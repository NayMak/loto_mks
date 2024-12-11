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
            return Center(
              child: Column(
                children: [
                  Text(
                    'JEU DU BINGO !',
                    style: TextStyle(
                      fontSize: 96,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
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
                              child: Expanded(
                                child: provider.currentCard == null
                                    ? Center(child: const Text('Lancer le jeu et tirer une carte pour commencer'))
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
                                          print(provider.gridViewAxisCount);
                                        },
                                        disable: provider.gridViewAxisCount == 3,
                                      ),
                                      SizedBox(width: 16),
                                      CircleButton(
                                        icon: FontAwesomeIcons.tableCells,
                                        onPressed: () {
                                          print(provider.gridViewAxisCount);
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
