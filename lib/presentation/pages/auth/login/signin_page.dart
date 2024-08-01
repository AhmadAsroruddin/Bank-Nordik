import 'package:bank_nordik/data/model/login_model.dart';
import 'package:bank_nordik/presentation/bloc/auth/login_bloc.dart';
import 'package:bank_nordik/presentation/pages/auth/register/register_page.dart';
import 'package:bank_nordik/presentation/pages/pin/pin_page.dart';
import 'package:bank_nordik/presentation/shared/RegisterHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  bool isEmailValid = true;
  LoginModel? userData;

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
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) async {
            if (state is LoginLoading) {
            } else if (state is LoginSuccess) {
              Navigator.of(context).pushNamed(PinPage.routeName);
            } else if (state is LoginFailed) {
              setState(() {
                isEmailValid = false;
              });
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  isEmailValid
                      ? Container()
                      : Container(
                          width: deviceWidth,
                          padding: EdgeInsets.all(deviceWidth * 0.03),
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 37, 102, 1)),
                          child: Text(
                            "Your Email is invalid, please try again",
                            style: whiteTextStyle,
                          ),
                        ),
                  SizedBox(height: deviceHeight * 0.07),
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
                          onPressed: () async {
                            if (!isValid(email.text)) {
                              setState(() {
                                isEmailValid = false;
                              });
                            } else {
                              context
                                  .read<LoginCubit>()
                                  .login(email.text, password.text);

                              setState(() {
                                isEmailValid = true;
                              });
                            }
                          },
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
                      style: GoogleFonts.poppins().copyWith(
                          color: greyColor, fontSize: deviceWidth * 0.04),
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.03,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  bool isValid(String email) {
    final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }
}
