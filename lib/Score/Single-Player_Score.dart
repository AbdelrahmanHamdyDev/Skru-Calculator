import 'package:flutter/material.dart';

class playerScore extends StatefulWidget {
  const playerScore({
    super.key,
    required this.Name,
    required this.Index,
    required this.AddScoreFun,
  });

  final String Name;
  final int Index;
  final void Function(int Score, int index) AddScoreFun;

  @override
  State<playerScore> createState() {
    return _PlayerScoreState();
  }
}

class _PlayerScoreState extends State<playerScore> {
  List<bool>? _isTextFieldEnabled;
  List<TextEditingController>? _TextFieldController;
  List<int>? _values;

  @override
  void initState() {
    _isTextFieldEnabled = List.generate(5, (index) => true);
    _TextFieldController = List.generate(5, (index) => TextEditingController());
    _values = List.generate(5, (index) => -1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;
    final ScreenHeight = MediaQuery.of(context).size.height;

    int score = _values!.where((value) => value != -1).fold(0, (a, b) => a + b);

    if (_values!.every((value) => value != -1)) {
      widget.AddScoreFun(score, widget.Index);
    }

    void CalcScore(int index) {
      int number;
      if (_TextFieldController![index].text.trim().isEmpty) {
        number = 0;
      } else {
        number = int.parse(_TextFieldController![index].text);
      }
      setState(() {
        _values![index] = number;
      });
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.Name,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        SizedBox(height: ScreenHeight / 40),
        ...List.generate(
          5,
          (ind) => SizedBox(
            width: ScreenWidth / 15,
            child: TextField(
              enabled: _isTextFieldEnabled![ind],
              keyboardType: TextInputType.number,
              controller: _TextFieldController![ind]
                ..text = (_values![ind] == -1) ? "" : _values![ind].toString(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: (ScreenHeight > ScreenWidth)
                    ? (ScreenHeight / ScreenWidth) * 14
                    : (ScreenHeight / ScreenWidth) * 48,
              ),
              onSubmitted: (value) {
                setState(() {
                  _isTextFieldEnabled![ind] = false;
                  CalcScore(ind);
                });
              },
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: ScreenHeight / 20),
        Text(
          score.toString(),
          style: TextStyle(
            fontSize: (ScreenHeight > ScreenWidth)
                ? (ScreenHeight / ScreenWidth) * 8
                : (ScreenHeight / ScreenWidth) * 32,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
