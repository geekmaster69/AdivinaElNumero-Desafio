import 'dart:math';

class GameLevel {
  final String label;
  final int tries;
  final int range;

  GameLevel({required this.label, required this.tries, required this.range});

  int get getRandomNumber => Random().nextInt(range) + 1;
}
