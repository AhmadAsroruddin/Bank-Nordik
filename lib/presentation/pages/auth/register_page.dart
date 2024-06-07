import 'package:bank_nordik/presentation/pages/auth/resgiter_upload_pic.dart';
import 'package:bank_nordik/presentation/shared/FormRegisterWidget.dart';
import 'package:bank_nordik/presentation/shared/button.dart';
import 'package:bank_nordik/presentation/shared/const.dart';
import 'package:bank_nordik/presentation/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/RegisterHeader.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  static const routeName = "/registerPage";

  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const RegisterHeader(),
              Container(
                width: deviceWidth * 0.9,
                padding: EdgeInsets.all(deviceWidth * 0.05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    FormRegisterWidget(controller: fullName, name: "Full Name"),
                    FormRegisterWidget(controller: email, name: "Email"),
                    FormRegisterWidget(controller: password, name: "Password"),
                    SizedBox(
                      height: deviceHeight * 0.02,
                    ),
                    CustomFilledButton(
                      title: "Continue",
                      onPressed: () async {
                        // context.read<RegisterCubit>().registerData(
                        //     fullName.text, email.text, password.text);
                        Navigator.of(context)
                            .pushNamed(RegisterUploadPic.routeName);
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              Text(
                "Sign In",
                style: GoogleFonts.poppins()
                    .copyWith(color: greyColor, fontSize: deviceWidth * 0.04),
              )
            ],
          ),
        ),
      ),
    );
  }
}
