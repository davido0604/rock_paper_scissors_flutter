import 'dart:math';

class Game {
  static int score = 0;

  static List<String> choices = ["Stein", "Saks", "Papir"];

  static String? randomChoice() {
    Random random = new Random();
    int robotChoiceIndex = random.nextInt(3);
    return choices[robotChoiceIndex];
  }
}

class Choice {
  String? type = "";

  static var gameRule = {
    "Stein": {
      "Stein": "Uavgjort!",
      "Papir": "Du tapte!",
      "Saks": "Du vant!",
    },
    "Saks": {
      "Stein": "Du tapte!",
      "Papir": "Du vant!",
      "Saks": "Uavgjort!",
    },
    "Papir": {
      "Stein": "Du vant!",
      "Papir": "Uavgjort",
      "Saks": "Du tapte ",
    },
  };

  Choice(this.type);
}
