import 'dart:math';

import 'package:bea_playground/features/memory/cards.dart';
import 'package:bea_playground/features/memory/memory_card.dart';

List<MemoryCard> getRandomCards() {
  List<int> indexes = [];
  final random = Random();

  while (indexes.length < 4) {
    final index = random.nextInt(cards.length);
    if (!indexes.contains(index)) {
      indexes.add(index);
    }
  }

  List<MemoryCard> chosen = [];

  for (var index in indexes) {
    chosen.add(cards[index]);
  }

  return chosen;
}
