import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hangman/const/consts.dart';
import 'package:hangman/game/figure_widget.dart';
import 'package:hangman/game/hidden_letters.dart';

class Gamescreens extends StatefulWidget {
  const Gamescreens({super.key});

  @override
  State<Gamescreens> createState() => _GamescreensState();
}

class _GamescreensState extends State<Gamescreens> {
  var characters = "abcdefghijklmnopqrstuvwxyz".toUpperCase();
  var word = "rishi".toUpperCase();
  List<String> selectedchar = [];
  var tries = 0;

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
                flex: 3,
                child: Column(
                  children: [
                    Expanded(
                        flex: 4,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            figure(GameUI.a0, tries >= 0),
                            figure(GameUI.a1, tries >= 1),
                            figure(GameUI.a2, tries >= 2),
                            figure(GameUI.a3, tries >= 3),
                            figure(GameUI.a4, tries >= 4),
                            figure(GameUI.a5, tries >= 5),
                            figure(GameUI.a6, tries >= 6),
                          ],
                        )),
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: word
                            .split("")
                            .map((e) => hiddenLetter(
                                e, !selectedchar.contains(e.toUpperCase())))
                            .toList(),
                      ),
                    )),
                  ],
                )),
            Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 7,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    children: characters.split("").map((e) {
                      return ElevatedButton(
                        onPressed: selectedchar.contains(e.toUpperCase())
                            ? null
                            : () {
                                setState(() {
                                  selectedchar.add(e.toUpperCase());
                                  if (!word
                                      .split("")
                                      .contains(e.toUpperCase())) {
                                    tries++;
                                  }
                                });
                              },
                        child: Text(
                          e,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                      );
                    }).toList(),
                  ),
                ))
          ],
        ));
  }
}
