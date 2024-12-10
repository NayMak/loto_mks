import 'dart:math';

import 'package:flutter/material.dart';
import 'package:loto_mks/models/loto_card.dart';

class LotoProvider extends ChangeNotifier {
  LotoCard? currentCard;
  List<LotoCard> remainingCards = [];
  List<LotoCard> announcedCards = [];

  void init() {
    currentCard = null;
    
    // On initialise le tableau duquel les cartes seront tirées
    remainingCards = List.generate(90, (index) {
      final asset =
          'assets/cards/card_${(index + 1).toString().padLeft(4, '0')}.jpg';

      return LotoCard(
        id: '${index + 1}',
        asset: asset,
      );
    });

    // On vide le tableau des cartes annoncées
    announcedCards.clear();
    notifyListeners();
  }

  void selectRandomCard() {
    if (remainingCards.isNotEmpty) {
      // On tire une carte au hasard
      final randomIndex = Random().nextInt(remainingCards.length);
      currentCard = remainingCards[randomIndex];

      // On l'ajoute au tableau des cartes annoncées
      if (currentCard != null) {
        announcedCards.add(currentCard!);
      }

      // On la retire du tableau des cartes restantes
      remainingCards.removeAt(randomIndex);
    }
    notifyListeners();
  }
}
