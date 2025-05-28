import 'dart:math';


class DiceRoller {
  static final _random = Random();

  static int roll() => _random.nextInt(6) + 1;
}

