import 'package:flutter/material.dart';

import 'package:skru/Score/Single-Player_Score.dart';

class scoreview extends StatefulWidget {
  const scoreview({
    super.key,
    required this.playersName,
    required this.switchFun,
    required this.winnerindexfun,
  });

  final List<String> playersName;
  final void Function() switchFun;
  final void Function(int index) winnerindexfun;

  @override
  State<scoreview> createState() {
    return _scoreviewState();
  }
}

class _scoreviewState extends State<scoreview> {
  bool checker = true;
  List<int>? PlayersScore;

  @override
  void initState() {
    PlayersScore = List<int>.generate(widget.playersName.length, (index) => 0);
    super.initState();
  }

  void AddScore(int Score, int index) {
    PlayersScore![index] = Score;
  }

  void FinishWork() {
    int smallScore = PlayersScore!
        .reduce((value, element) => value < element ? value : element);
    int smallscoreindex = PlayersScore!.indexOf(smallScore);
    widget.winnerindexfun(smallscoreindex);
    widget.switchFun();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final ScreenWidth = MediaQuery.of(context).size.width;
    final ScreenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: (widget.playersName.length > 7 &&
              orientation == Orientation.portrait)
          ? const Text("Flip The Screen")
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: ScreenHeight / 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      color: Theme.of(context).colorScheme.error,
                      child: Padding(
                        padding:
                            EdgeInsets.all((ScreenHeight / ScreenWidth) * 5),
                        child: Text(
                          "Score Board",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onError,
                                fontSize: (ScreenHeight > ScreenWidth)
                                    ? (ScreenHeight / ScreenWidth) * 14
                                    : (ScreenHeight / ScreenWidth) * 48,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenHeight / 20),
                    Container(
                      color: Theme.of(context).colorScheme.surface,
                      child: Padding(
                        padding:
                            EdgeInsets.all((ScreenHeight / ScreenWidth) * 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(
                            widget.playersName.length,
                            (index) => playerScore(
                              Name: widget.playersName[index],
                              Index: index,
                              AddScoreFun: AddScore,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenHeight / 10),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: ScreenWidth / 20,
                      ),
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: FinishWork,
                        child: const Text(
                          "Finish",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
