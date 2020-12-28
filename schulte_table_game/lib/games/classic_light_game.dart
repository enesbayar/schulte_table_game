import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:schulte_table_game/cell.dart';
import 'package:schulte_table_game/game_model.dart';
import 'package:schulte_table_game/home_page.dart';

class ClassicLightGamePage extends StatefulWidget {
  @override
  _GamePageStatePage createState() => _GamePageStatePage();
}

class _GamePageStatePage extends State<ClassicLightGamePage> {
  List<Cell> cellList;
  int nextTo;
  Stopwatch stopwatch = Stopwatch();
  Timer timer;
  String elapsedTime;
  bool restart;
  @override
  void initState() {
    super.initState();
    cellList = List<Cell>.generate(25, (index) {
      return Cell(index + 1);
    });
    cellList.shuffle();
    nextTo = 1;
    startWatch();
    restart = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(GameModel.classicLightGame),
      ),
      body: buildGame(context),
    );
  }

  Widget buildGame(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black26,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(GameModel.time + "$elapsedTime",style: TextStyle(fontSize: 18),),
                Text(GameModel.bestScore + GameModel.classicLightBestScore.toString(),style: TextStyle(fontSize: 18),),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                height: 400,
                width: 400,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Stack(
                  children: [
                    GridView.builder(
                        itemCount: cellList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () => _onTap(cellList[index]),
                              child: cellList[index].isSelected == null
                                  ? buildDefaultCell(index)
                                  : buildSelectedCell(index));
                        }),
                  ],
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildHomePage(),
              SizedBox(height: 10),
              if (restart) ...[buildRestartButton()]
            ],
          ),
        ],
      ),
    );
  }

  Container buildSelectedCell(int index) {
    return Container();
  }

  Container buildDefaultCell(int index) {
    return Container(
      decoration: BoxDecoration(border: Border.all(), color: Colors.deepOrange),
      child: Center(
          child: Text(
        "${cellList[index].value}",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      )),
    );
  }

  Widget buildHomePage() {
    return Container(
      height: 40,
      width: 140,
      padding: EdgeInsets.only(right: 15),
      child: RaisedButton(
        onPressed: () {
          stopWatch();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        color: Colors.white,
        splashColor: Colors.deepOrange,
        child: Text(
          GameModel.homePage,
          style:
              TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildRestartButton() {
    return Container(
      height: 40,
      width: 140,
      padding: EdgeInsets.only(right: 15),
      child: RaisedButton(
        onPressed: () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ClassicLightGamePage())),
        color: Colors.deepOrange,
        splashColor: Colors.deepOrange,
        child: Text(
          GameModel.restart,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void _onTap(Cell cell) {
    if (cell.value == nextTo) {
      setState(() {
        nextTo++;
        cell.isSelected = true;
      });
    }
    if (nextTo == 26) {
      setState(() {
        restart = true;
      });
      stopWatch();
      buildBestScore();
    }
  }

  void startWatch() {
    stopwatch.start();
    setState(() {
      timer = Timer.periodic(Duration(milliseconds: 100), updateTime);
    });
  }

  void updateTime(Timer timer) {
    if (stopwatch.isRunning) {
      setState(() {
        elapsedTime = stopwatch.elapsed.toString();
      });
    }
  }

  void stopWatch() {
    setState(() {
      stopwatch.stop();
      elapsedTime = stopwatch.elapsed.toString();
    });
  }

  void buildBestScore() {
    setState(() {
      if (GameModel.classicLightBestScore == Duration.zero ||
          GameModel.classicLightBestScore > stopwatch.elapsed) {
        GameModel.classicLightBestScore = stopwatch.elapsed;
      }
    });
  }
}
