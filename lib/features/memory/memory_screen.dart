import 'package:bea_playground/features/memory/memory_card.dart';
import 'package:bea_playground/features/memory/utils.dart';
import 'package:flutter/material.dart';

class MemoryScreen extends StatefulWidget {
  const MemoryScreen({super.key});

  @override
  State<MemoryScreen> createState() => _MemoryScreenState();
}

class _MemoryScreenState extends State<MemoryScreen> {
  final String cardBackPath = "images/back.png";
  List<MemoryCard> cards = [];
  List<int> selectedCards = [];
  bool paused = false;

  @override
  void initState() {
    newGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: cards.every((card) => card.matched) ? 0.5 : 1,
            child: Center(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: cards
                    .map(
                      (card) =>
                          card.matched || selectedCards.contains(card.index)
                              ? Image.asset(card.imagePath)
                              : GestureDetector(
                                  onTap: () {
                                    if (paused) return;

                                    if (selectedCards.isEmpty) {
                                      setState(() {
                                        selectedCards.add(card.index!);
                                      });
                                    } else {
                                      setState(() {
                                        selectedCards.add(card.index!);
                                      });

                                      if (cards[selectedCards[0]].imagePath ==
                                          cards[selectedCards[1]].imagePath) {
                                        // Cards matches
                                        cards[selectedCards[0]] =
                                            cards[selectedCards[0]]
                                                .copyWith(matched: true);
                                        cards[selectedCards[1]] =
                                            cards[selectedCards[1]]
                                                .copyWith(matched: true);
                                        setState(() {
                                          selectedCards = [];
                                        });
                                      } else {
                                        resetSelected();
                                      }
                                    }
                                  },
                                  child: Image.asset(cardBackPath),
                                ),
                    )
                    .toList(),
              ),
            ),
          ),
          if (cards.every((card) => card.matched))
            Center(
              child: IconButton(
                onPressed: newGame,
                icon: const Icon(
                  Icons.refresh_rounded,
                  size: 96.0,
                  color: Colors.green,
                ),
                alignment: Alignment.center,
                iconSize: 96.0,
              ),
            ),
        ],
      ),
    );
  }

  void newGame() {
    setState(() {
      cards = [];
      selectedCards = [];

      cards = getRandomCards();

      cards = [...cards, ...cards];

      cards.shuffle();

      int index = -1;

      cards = cards.map((card) {
        ++index;
        return card.copyWith(index: index);
      }).toList();
    });
  }

  Future<void> resetSelected() {
    setState(() {
      paused = true;
    });
    return Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        selectedCards = [];
        paused = false;
      });
    });
  }
}
