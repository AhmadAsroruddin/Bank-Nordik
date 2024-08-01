import 'package:bank_nordik/presentation/shared/const.dart';
import 'package:flutter/material.dart';

import 'theme.dart';

class PinButton extends StatelessWidget {
  final String number;
  final Function onTap;

  const PinButton({
    super.key,
    required this.number,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: CircleAvatar(
        maxRadius: deviceWidth * 0.08,
        backgroundColor: const Color.fromRGBO(26, 29, 46, 1.0),
        child: Text(
          number,
          style: whiteTextStyle.copyWith(fontWeight: bold),
        ),
      ),
    );
  }
}
