import 'package:flutter/material.dart';
import 'package:loto_mks/models/loto_card.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Loto MKS'),
      ),
      body: ChangeNotifierProvider.value(
        value: LotoProvider(),
        child: Consumer<LotoProvider>(
          builder: (BuildContext context, provider, Widget? child) {
            return Center(
              child: Column(
                children: [
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      provider.init();
                    },
                    child: const Text('Init'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      provider.selectRandomCard();
                    },
                    child: const Text('Select random card'),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: provider.currentCard == null
                              ? Center(child: const Text('No card selected'))
                              : Center(
                                child: Image(
                                    image: AssetImage(
                                      provider.currentCard!.asset,
                                    ),
                                  ),
                              ),
                        ),
                        /*
                        Expanded(
                          child: Selector<LotoProvider, LotoCard?>(
                            selector: (_, provider) {
                              return provider.currentCard;
                            },
                            builder: (_, currentCard, __) {
                            debugPrint('Selector called');
                            debugPrint('currentCard: $currentCard');
                              if (currentCard == null) {
                                return Text('No card selected');
                              }
                              return Image(
                                image: AssetImage(
                                  currentCard.asset,
                                ),
                              );
                            },
                          ),
                        ),
                          */
                        Expanded(
                          child: GridView.count(
                            primary: false,
                            padding: const EdgeInsets.all(8),
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4,
                            crossAxisCount: 5,
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
            );
          },
        ),
      ),
    );
  }
}
