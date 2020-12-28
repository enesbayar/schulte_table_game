import 'package:flutter/material.dart';
import 'package:schulte_table_game/game_model.dart';
import 'package:schulte_table_game/games/classic_light_game.dart';

class ClassicLightGameButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      padding: EdgeInsets.only(right: 15),
      child: RaisedButton(
        onPressed: () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ClassicLightGamePage())),
        color: Colors.blueGrey,
        child: Text(
          GameModel.classicLightGame,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}