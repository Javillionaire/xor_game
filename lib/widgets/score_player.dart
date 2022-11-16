import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  final String? player;
  final bool? isTheme;
  final Color? color;
  const Player({
    Key? key,
    required this.player,
    required this.color,
    required this.isTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: 'Player',
            style: TextStyle(
                color: isTheme! ? Colors.white : Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'SFPro'),
            children: [
          TextSpan(
            text: player,
            style: TextStyle(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'SFPro'),
          )
        ]));
  }
}
