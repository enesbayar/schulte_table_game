import 'package:flutter/material.dart';
import 'package:schulte_table_game/game_model.dart';
import 'package:schulte_table_game/home_page_widgets/classic_game_button.dart';
import 'package:schulte_table_game/home_page_widgets/classic_light_game_button.dart';
import 'package:schulte_table_game/home_page_widgets/reaction_game_button.dart';
import 'package:schulte_table_game/home_page_widgets/reverse_classic_game_button.dart';

import 'home_page_widgets/reverse_classic_light_game_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(GameModel.schulteTableGame),

      ),
      body: buildHomePage(context),
    );
  }

  Widget buildHomePage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black38,
      child: Center(
        child: Container(
          height: 500,
          width: 500,
          decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all()
          ),
          child: Padding(
            padding: const EdgeInsets.only(top:30.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClassicGameButton(),
                    ReverseClassicGameButton()
                  ],
                ),
                SizedBox(height:50),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClassicLightGameButton(),
                    ReverseClassicLightGameButton()
                  ],
                ),
                SizedBox(height:50),
                ReactionGameButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

