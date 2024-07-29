import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class Alert extends StatelessWidget {
  const Alert({super.key, required this.Message});

  final String Message;

  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;
    final ScreenHeight = MediaQuery.of(context).size.height;

    final Widget Title = Text(
      "Error",
      style: TextStyle(
        color: Theme.of(context).colorScheme.inverseSurface,
        fontSize: (ScreenHeight > ScreenWidth)
            ? (ScreenHeight / ScreenWidth) * 14
            : (ScreenHeight / ScreenWidth) * 48,
      ),
    );

    final Widget Content = Text(
      Message,
      style: TextStyle(
        color: Theme.of(context).colorScheme.inverseSurface,
        fontSize: (ScreenHeight > ScreenWidth)
            ? (ScreenHeight / ScreenWidth) * 8
            : (ScreenHeight / ScreenWidth) * 32,
      ),
    );

    final List<Widget> Actions = [
      OutlinedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          "OK",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inverseSurface,
            fontSize: (ScreenHeight > ScreenWidth)
                ? (ScreenHeight / ScreenWidth) * 8
                : (ScreenHeight / ScreenWidth) * 32,
          ),
        ),
      ),
    ];
    var AlertType = (Platform.isIOS)
        ? CupertinoAlertDialog(
            title: Title,
            content: Content,
            actions: Actions,
          )
        : AlertDialog(
            title: Title,
            content: Content,
            actions: Actions,
          );

    return AlertType;
  }
}
