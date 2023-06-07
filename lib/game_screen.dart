import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hangman/const/consts.dart';
import 'package:hangman/game/figure_widget.dart';
import 'package:hangman/game/hidden_letters.dart';
import 'package:hangman/home_screen.dart' as globals;
import 'dart:math';

String generateRandomStringFromList(List<String> list) {
  final random = Random();
  final index = random.nextInt(list.length);
  return list[index];
}

//var word = globals.guess_word;
final word_list = ['John', 'Mary', 'Peter'];
var word = generateRandomStringFromList(word_list).toUpperCase();
//final hint_list = {};
//var hint = "";

class Gamescreens extends StatefulWidget {
  const Gamescreens({super.key});

  @override
  State<Gamescreens> createState() => _GamescreensState();
}

class _GamescreensState extends State<Gamescreens> {
  var characters = "abcdefghijklmnopqrstuvwxyz".toUpperCase();

  List<String> selectedchar = [];
  var tries = 0;

  get leadDialog => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text("HANGMAN"),
          centerTitle: true,
          backgroundColor: Colors.transparent
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  setState(() {
                    word =
                        generateRandomStringFromList(word_list).toUpperCase();
                    tries = 0;
                    selectedchar = [];
                  });
                },
                icon: Icon(Icons.refresh)),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Hint"),
                          content: Text(word),
                          actions: [
                            TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 27, 134, 255),
                                  foregroundColor:
                                      Color.fromRGBO(255, 255, 255, 1),
                                ),
                                child: Text("close"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                })
                          ],
                        );
                      });
                },
                icon: Icon(Icons.info))
          ],
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
