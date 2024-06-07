import 'package:flutter/material.dart';

import 'theme.dart';

class CircleDot extends StatelessWidget {
  const CircleDot({super.key, required this.currIndex, required this.number});

  final int currIndex;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      margin: const EdgeInsets.only(
        right: 10,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currIndex == number ? blueColor : lightBackgroundColor,
      ),
    );
  }
}
