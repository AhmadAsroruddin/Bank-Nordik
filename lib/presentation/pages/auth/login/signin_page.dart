import 'package:bank_nordik/presentation/pages/auth/register/register_page.dart';
import 'package:bank_nordik/presentation/shared/RegisterHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/FormRegisterWidget.dart';
import '../../../shared/button.dart';
import '../../../shared/const.dart';
import '../../../shared/theme.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  static const routeName = "/SignInPage";

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const RegisterHeader(
                upperText: "Sign In &",
                lowerText: "Grow Your Finance",
              ),
              Container(
                width: deviceWidth * 0.9,
                padding: EdgeInsets.all(deviceWidth * 0.05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    FormRegisterWidget(
                      controller: email,
                      name: "Email Address",
                      func: (email) {
                        if (!isValid(email)) {
                          print("salah brai");
                        } else {
                          print("betul");
                        }
                      },
                    ),
                    FormRegisterWidget(
                      controller: password,
                      name: "Password",
                      isPassword: true,
                    ),
                    Row(
                      children: <Widget>[
                        const Spacer(),
                        Text(
                          "Forgot Password",
                          style: GoogleFonts.poppins().copyWith(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: deviceHeight * 0.02,
                    ),
                    CustomFilledButton(
                      title: "Continue",
                      onPressed: () async {},
                    )
                  ],
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(RegisterPage.routeName);
                },
                child: Text(
                  "Create Account",
                  style: GoogleFonts.poppins()
                      .copyWith(color: greyColor, fontSize: deviceWidth * 0.04),
                ),
              )
            ]),
      ),
    );
  }

  bool isValid(String email) {
    final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }
}
