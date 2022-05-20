// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, deprecated_member_use

import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(
            title: Center(
              child: Text(
                'Dicee',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 36.0,
                ),
              ),
            ),
            backgroundColor: Colors.red,
          ),
          body: DicePage(),
        ),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left_dice_number = 1;
  int right_dice_number = 1;
  int score_player1 = 0;
  int score_player2 = 0;

  void DiceFaceChange() {
    left_dice_number = Random().nextInt(6) + 1;
    right_dice_number = Random().nextInt(6) + 1;

    score_player1 = score_player1 + left_dice_number;
    score_player2 = score_player2 + right_dice_number;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Player 1",
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 28.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    "VS",
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    "Player 2",
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 28.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          DiceFaceChange();
                        });
                      },
                      child: Image.asset('images/dice$left_dice_number.png'),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          DiceFaceChange();
                        });
                      },
                      child: Image.asset('images/dice$right_dice_number.png'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Score: $score_player1",
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 28.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    "Score: $score_player2",
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 28.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
