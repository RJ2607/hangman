import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Gamescreens extends StatefulWidget {
  const Gamescreens({super.key});

  @override
  State<Gamescreens> createState() => _GamescreensState();
}

class _GamescreensState extends State<Gamescreens> {
  var characters = "abcdefghijklmnopqrstuvwxyz".toUpperCase();
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
                child: Column(
              children: [
                Expanded(flex: 4, child: Container(color: Colors.amber)),
                Expanded(child: Container(color: Colors.green)),
              ],
            )),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(8),
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 6,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                children: characters.split("").map((e) {
                  return ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      e,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  );
                }).toList(),
              ),
            ))
          ],
        ));
  }
}
