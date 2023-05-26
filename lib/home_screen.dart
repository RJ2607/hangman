import "package:flutter/material.dart";
import "package:hangman/const/consts.dart";
import "package:hangman/game/figure_widget.dart";
import "package:hangman/game_screen.dart";
import "package:hangman/gradienttext.dart";

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

var a = 0;

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("HANGMAN: THE WORD GAME"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: Stack(
                        children: [figure(GameUI.aImg, a == 0)],
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        child: GradientText(
                          "WELCOME",
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                          gradient: LinearGradient(colors: [
                            Colors.blue.shade400,
                            Colors.blue.shade900,
                          ]),
                        ),
                      ))
                ],
              )),
          Expanded(
              flex: 3,
              child: Container(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                      height: 80,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Gamescreens()));
                        },
                        child: Text(
                          "PLAY",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.all(15),
                        ),
                      ))))
        ],
      ),
    );
  }
}
