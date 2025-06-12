import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loto_mks/components/floating_toolbar.dart';
import 'package:loto_mks/components/bingo_modal.dart';
import 'package:loto_mks/models/bingo_button.dart';
import 'package:loto_mks/models/toolbar_button.dart';
import 'package:loto_mks/provider/loto_provider.dart';
import 'package:provider/provider.dart';

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
            style: GoogleFonts.luckiestGuy(
              fontSize: 32,
              color: Color(0xFF1A237E),
            ),
          ),
          leading: IconButton(
            iconSize: 30,
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Color(0xFFCFD8DC),
          centerTitle: true,
          scrolledUnderElevation: 0,
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
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                child: provider.currentCard == null
                                    ? Text(
                                        'Lancer le jeu pour commencer à tirer les cartes',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.luckiestGuy(
                                          fontSize: 20,
                                          color: Color(0xFF1A237E),
                                        ),
                                      )
                                    : Image(
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
                              padding: const EdgeInsets.all(16.0),
                              child: GridView.count(
                                crossAxisSpacing: 4,
                                mainAxisSpacing: 4,
                                crossAxisCount: provider.gridViewAxisCount,
                                children: provider.announcedCards.map((card) {
                                  return Image(image: AssetImage(card.asset));
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FloatingToolbar(
                    buttons: !provider.isGameStarted
                        ? [
                            ToolbarButtonData(
                              icon: FontAwesomeIcons.circlePlay,
                              onPressed: () {
                                provider
                                  ..init()
                                  ..startGame()
                                  ..selectRandomCard();
                              },
                            ),
                          ]
                        : [
                            ToolbarButtonData(
                              icon: FontAwesomeIcons.arrowRotateRight,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      ChangeNotifierProvider.value(
                                    value: provider,
                                    child: BingoModal(
                                      title:
                                          'Souhaitez-vous démarrer une nouvelle partie ?',
                                      subtitle:
                                          'Les numéros tirées lors de la partie en cours seront réinitialisés.',
                                    ),
                                  ),
                                );
                              },
                              color: Colors.redAccent,
                            ),
                            ToolbarButtonData(
                              icon: FontAwesomeIcons.fileArrowUp,
                              onPressed: () => provider.selectRandomCard(),
                            ),
                            ToolbarButtonData(
                              icon: provider.gridViewAxisCount == 3
                                  ? FontAwesomeIcons.tableCellsLarge
                                  : FontAwesomeIcons.tableCells,
                              onPressed: () {
                                final newCount =
                                    provider.gridViewAxisCount == 3 ? 5 : 3;
                                provider.updateGridViewAxisCount(newCount);
                              },
                              color: Colors.blue,
                            ),
                          ],
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: Consumer<LotoProvider>(
          builder: (context, provider, child) {
            if (provider.isGameStarted) {
              return BingoButton();
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
