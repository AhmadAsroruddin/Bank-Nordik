import 'package:bank_nordik/presentation/shared/const.dart';
import 'package:bank_nordik/presentation/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormRegisterWidget extends StatelessWidget {
  const FormRegisterWidget(
      {super.key,
      required this.controller,
      required this.name,
      this.isPassword = false,
      this.isPin = false});

  final TextEditingController controller;
  final String name;
  final bool isPassword;
  final bool isPin;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          name,
          style: GoogleFonts.poppins().copyWith(fontWeight: bold),
        ),
        SizedBox(height: deviceHeight * 0.01),
        Container(
          padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.02),
          margin: EdgeInsets.only(bottom: deviceHeight * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1),
          ),
          child: TextField(
            maxLength: isPin ? 6 : 500,
            obscureText: isPassword,
            controller: controller,
            decoration: const InputDecoration(
              border: InputBorder.none,
              counterText: "",
            ),
          ),
        )
      ],
    );
  }
}
