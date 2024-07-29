import 'package:flutter/material.dart';

class result extends StatelessWidget {
  const result({super.key, required this.winnerplayer});

  final String winnerplayer;

  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;
    final ScreenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "The Winner is :",
          style: TextStyle(
            fontSize: (ScreenHeight > ScreenWidth)
                ? (ScreenHeight / ScreenWidth) * 8
                : (ScreenHeight / ScreenWidth) * 32,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        Text(
          winnerplayer,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: (ScreenHeight > ScreenWidth)
                    ? (ScreenHeight / ScreenWidth) * 14
                    : (ScreenHeight / ScreenWidth) * 48,
              ),
        ),
        // const SizedBox(height: 20),
        // OutlinedButton.icon(
        //   onPressed: restartFun,
        //   icon: Icon(
        //     Icons.restart_alt,
        //     color: Theme.of(context).colorScheme.error,
        //   ),
        //   label: Text(
        //     "Restart",
        //     style: TextStyle(
        //       fontSize: (ScreenHeight > ScreenWidth)
        //           ? (ScreenHeight / ScreenWidth) * 8
        //           : (ScreenHeight / ScreenWidth) * 32,
        //       color: Theme.of(context).colorScheme.onSurface,
        //     ),
        //   ),
        // )
      ],
    );
  }
}
