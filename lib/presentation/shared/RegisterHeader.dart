import 'package:bank_nordik/presentation/shared/const.dart';
import 'package:bank_nordik/presentation/shared/theme.dart';
import 'package:flutter/material.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: deviceHeight * 0.06,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/logo_black.png',
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(deviceWidth * 0.05),
          margin: EdgeInsets.only(top: deviceHeight * 0.05),
          height: deviceHeight * 0.15,
          width: deviceWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Join Us to Unlock",
                style: blackTextStyle.copyWith(
                    fontWeight: bold, fontSize: deviceWidth * 0.05),
              ),
              Text(
                "Your Growth",
                style: blackTextStyle.copyWith(
                    fontWeight: bold, fontSize: deviceWidth * 0.05),
              )
            ],
          ),
        ),
      ],
    );
  }
}
