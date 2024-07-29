import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class welcome extends StatelessWidget {
  const welcome({super.key, required this.switchFun});

  final void Function() switchFun;

  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;
    final ScreenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          color: Theme.of(context).colorScheme.secondaryContainer,
          margin: (ScreenHeight > ScreenWidth)
              ? EdgeInsets.symmetric(
                  horizontal: ScreenWidth / 20,
                  vertical: ScreenHeight / 3.2,
                )
              : EdgeInsets.symmetric(
                  horizontal: ScreenWidth / 4,
                  vertical: ScreenHeight / 4,
                ),
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenWidth / 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome To",
                  style: TextStyle(
                    fontSize: (ScreenHeight > ScreenWidth)
                        ? (ScreenHeight / ScreenWidth) * 8
                        : (ScreenHeight / ScreenWidth) * 32,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Text(
                  "Skru Score Calculator",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: (ScreenHeight > ScreenWidth)
                            ? (ScreenHeight / ScreenWidth) * 14
                            : (ScreenHeight / ScreenWidth) * 48,
                      ),
                ),
                SizedBox(height: ScreenHeight / 10),
                OutlinedButton.icon(
                  onPressed: switchFun,
                  icon: Icon(
                    Icons.arrow_right_alt,
                    color: Theme.of(context).colorScheme.onSurface,
                    size: (ScreenHeight > ScreenWidth)
                        ? (ScreenHeight / ScreenWidth) * 14
                        : (ScreenHeight / ScreenWidth) * 32,
                  ),
                  label: Text(
                    "Start",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: (ScreenHeight > ScreenWidth)
                              ? (ScreenHeight / ScreenWidth) * 8
                              : (ScreenHeight / ScreenWidth) * 32,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: (ScreenHeight > ScreenWidth) ? 0 : ScreenWidth / 6,
              vertical: (ScreenHeight > ScreenWidth)
                  ? ScreenHeight / 4
                  : ScreenHeight / 7,
            ),
            alignment: Alignment.bottomRight,
            child: Container(
              child: Image.asset(
                "assets/Images/skru_logo.png",
                scale: (ScreenHeight > ScreenWidth)
                    ? (ScreenHeight / ScreenWidth) * 3
                    : (ScreenHeight / ScreenWidth) * 11,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
