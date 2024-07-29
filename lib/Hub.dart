import 'package:flutter/material.dart';
import 'package:skru/Score/Single-Player_Score.dart';

import 'package:skru/Welcome/Welcome_Screen.dart';
import 'package:skru/Welcome/Info_page/Players_Info.dart';
import 'package:skru/Score/score_screen.dart';
import 'package:skru/Score/Result_Screen.dart';

class hub extends StatefulWidget {
  const hub({super.key});

  @override
  State<hub> createState() {
    return _hubState();
  }
}

class _hubState extends State<hub> {
  List<String> PlayersName = [];
  int WinnerIndex = -1;
  String CurrentScreen = "welcome";

  void SwitchScreen() {
    setState(() {
      if (CurrentScreen == "welcome") {
        CurrentScreen = "info";
      } else if (CurrentScreen == "info") {
        CurrentScreen = "score";
      } else {
        CurrentScreen = "result";
      }
    });
  }

  void AddPlayerName(String name) {
    if (name.trim().isEmpty) {
      PlayersName.add("P${PlayersName.length + 1}");
      return;
    }
    PlayersName.add(name);
  }

  void setWinnerIndex(int ind) {
    setState(() {
      WinnerIndex = ind;
    });
  }

  @override
  Widget build(BuildContext context) {
    var ShowScreen = (CurrentScreen == "welcome")
        ? welcome(
            switchFun: SwitchScreen,
          )
        : (CurrentScreen == "info")
            ? info(
                addPlayer: AddPlayerName,
                switchFun: SwitchScreen,
              )
            : (CurrentScreen == "score")
                ? scoreview(
                    playersName: PlayersName,
                    switchFun: SwitchScreen,
                    winnerindexfun: setWinnerIndex,
                  )
                : result(
                    winnerplayer: PlayersName[WinnerIndex],
                  );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        alignment: Alignment.center,
        child: ShowScreen,
      ),
    );
  }
}
