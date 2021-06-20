import 'package:flutter/material.dart';
import 'package:schulte_table_game/game_model.dart';
import 'package:schulte_table_game/games/classic_game_page.dart';

class ClassicGameButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      padding: EdgeInsets.only(right: 15),
      child: RaisedButton(
        onPressed: () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ClassicGamePage())),
        color: Colors.blueGrey,
        child: Text(
          GameModel.classicGame,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}