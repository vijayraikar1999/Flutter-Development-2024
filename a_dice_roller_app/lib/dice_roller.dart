import 'dart:math';

import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  int imageNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice$imageNumber.png',
          width: 200.0,
        ),
        const SizedBox(
          height: 20.0,
        ),
        TextButton(
          onPressed: () {
            setState(() {
              imageNumber = randomizer.nextInt(6) + 1;
            });
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28.0,
            ),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}
