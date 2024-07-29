import 'package:flutter/material.dart';
import 'dart:async';

import 'package:skru/Welcome/Info_page/Alert.dart';

class info extends StatefulWidget {
  const info({super.key, required this.addPlayer, required this.switchFun});

  final void Function(String name) addPlayer;
  final void Function() switchFun;

  @override
  State<info> createState() {
    return _infoState();
  }
}

class _infoState extends State<info> {
  int PLayerNumbers = 0;

  void _handleSubmitted(String val) {
    var IsNum = int.tryParse(val);
    if (IsNum == null || IsNum < 2) {
      showDialog(
        context: context,
        builder: (ctk) => const Alert(
          Message: "Enter Number bigger than 1",
        ),
      );
    } else {
      setState(() {
        PLayerNumbers = IsNum;
      });
    }
  }

  void FinishWork(var _inputController) {
    for (var i in _inputController) {
      widget.addPlayer(i.text);
      i.dispose();
    }
    widget.switchFun();
  }

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> inputController =
        List<TextEditingController>.generate(
      PLayerNumbers,
      (index) => TextEditingController(),
    );

    final ScreenWidth = MediaQuery.of(context).size.width;
    final ScreenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenWidth / 10,
          vertical: ScreenHeight / 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (PLayerNumbers == 0)
                TextField(
                  keyboardType: TextInputType.number,
                  onSubmitted: _handleSubmitted,
                  maxLength: 1,
                  style: TextStyle(
                    fontSize: (ScreenHeight > ScreenWidth)
                        ? (ScreenHeight / ScreenWidth) * 8
                        : (ScreenHeight / ScreenWidth) * 32,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  decoration: InputDecoration(
                    labelText: "Enter the number of players ",
                    labelStyle: TextStyle(
                      fontSize: (ScreenHeight > ScreenWidth)
                          ? (ScreenHeight / ScreenWidth) * 8
                          : (ScreenHeight / ScreenWidth) * 32,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    suffixText: "Players",
                    suffixStyle: TextStyle(
                      fontSize: (ScreenHeight > ScreenWidth)
                          ? (ScreenHeight / ScreenWidth) * 8
                          : (ScreenHeight / ScreenWidth) * 32,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                )
              else
                Text(
                  "Enter Players Name",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: (ScreenHeight > ScreenWidth)
                            ? (ScreenHeight / ScreenWidth) * 14
                            : (ScreenHeight / ScreenWidth) * 48,
                      ),
                ),
              SizedBox(height: ScreenHeight / 20),
              SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    PLayerNumbers,
                    (index) {
                      return TextField(
                        maxLength: 6,
                        controller: inputController[index],
                        style: TextStyle(
                          fontSize: (ScreenHeight > ScreenWidth)
                              ? (ScreenHeight / ScreenWidth) * 8
                              : (ScreenHeight / ScreenWidth) * 32,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        decoration: InputDecoration(
                          label: Text("Player ${index + 1}"),
                          labelStyle: TextStyle(
                            fontSize: (ScreenHeight > ScreenWidth)
                                ? (ScreenHeight / ScreenWidth) * 8
                                : (ScreenHeight / ScreenWidth) * 32,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              if (PLayerNumbers != 0)
                ElevatedButton(
                  onPressed: () {
                    FinishWork(inputController);
                  },
                  child: const Text("Next"),
                ),
              SizedBox(height: ScreenHeight / 30),
            ],
          ),
        ),
      ),
    );
  }
}
