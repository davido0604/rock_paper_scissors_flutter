import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/screens/main_screen.dart';

import '../utils/game.dart';
import '../widgets/game_button.dart';

class GameScreen extends StatefulWidget {
  GameScreen(this.gameChoice, {Key? key}) : super(key: key);
  Choice gameChoice;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery
        .of(context)
        .size
        .width / 2 - 40;
    String? robotChoice = Game.randomChoice();
    String robotChoicePath = "";

    switch (robotChoice) {
      case "Stein":
        robotChoicePath = "images/rock.png";
        break;
      case "Saks":
        robotChoicePath = "images/scissors.png";
        break;
      case "Papir":
        robotChoicePath = "images/paper.png";
        break;
      default:
    }

    String? player_choices;
    switch (widget.gameChoice.type) {
      case "Stein":
        player_choices = "images/rock.png";
        break;
      case "Saks":
        player_choices = "images/scissors.png";
        break;
      case "Papir":
        player_choices = "images/paper.png";
        break;
      default:
    }

    if (Choice.gameRule[widget.gameChoice.type]![robotChoice] == "Du vant!") {
      setState(() {
        Game.score++;
      });
    }

    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 34.0, horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 5.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "STILLING",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${Game.score}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 2,
              child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Hero(
                        tag: "${widget.gameChoice.type}",
                        child: gameButton(null, player_choices!, btnWidth),
                      ),
                      Text(
                        "VS",
                        style: TextStyle(color: Colors.white, fontSize: 26.0),
                      ),
                      gameButton(null, robotChoicePath, btnWidth),
                    ],
                  )),
            ),

            Text("${Choice.gameRule[widget.gameChoice.type]![robotChoice]}",
              style: TextStyle(color: Colors.white, fontSize: 36.0),),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(),
                      ));
                },
                padding: const EdgeInsets.all(16.0),
                shape: const StadiumBorder(
                  side: BorderSide(
                    color: Colors.white,
                    width: 5.0,
                  ),
                ),
                child: const Text(
                  "SPILL IGJEN",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
