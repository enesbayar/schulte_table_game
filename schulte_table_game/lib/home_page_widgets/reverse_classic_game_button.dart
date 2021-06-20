import 'package:flutter/material.dart';
import 'package:schulte_table_game/game_model.dart';
import 'package:schulte_table_game/games/reverse_classic_game_page.dart';

class ReverseClassicGameButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      padding: EdgeInsets.only(right: 15),
      child: RaisedButton(
        onPressed: () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ReverseClassicGamePage())),
        color: Colors.blueGrey,
        child: Text(
          GameModel.reverseClassicGame,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
        ),
      ),
    );
  }
}