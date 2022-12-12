import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/screens/game_screen.dart';
import 'package:rock_paper_scissors/widgets/game_button.dart';

import '../utils/game.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery.of(context).size.width / 2 - 40;

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
            SizedBox(
              height: 65.0,
            ),
            Flexible(
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1,
                child: Center(
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          left: MediaQuery.of(context).size.width / 2 -
                              btnWidth / 2 -
                              20,
                          child: Hero(
                            tag: "Stein",
                            child: gameButton(() {
                              if (kDebugMode) {
                                print("Du valgte stein!");
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        GameScreen(
                                          Choice("Stein"),

                                        ),
                                  ));
                            }, "images/rock.png", btnWidth),
                          )),
                      Positioned(
                          top: btnWidth,
                          left: MediaQuery.of(context).size.width / 2 -
                              btnWidth -
                              40,
                          child: Hero(
                            tag: "Rock",
                            child: gameButton(() {
                              if (kDebugMode) {
                                print("Du valgte papir!");
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        GameScreen(
                                            Choice("Papir"),

                                        ),
                                  ));
                            }, "images/paper.png", btnWidth),
                          )),
                      Positioned(
                          top: btnWidth,
                          right: MediaQuery.of(context).size.width / 2 -
                              btnWidth -
                              40,
                          child: Hero(
                            tag: "Saks",
                            child: gameButton(() {
                              if (kDebugMode) {
                                print("Du valgte saks!");
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        GameScreen(
                                          Choice("Saks"),

                                        ),
                                  ));
                            }, "images/scissors.png", btnWidth),
                          )),
                    ],
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
