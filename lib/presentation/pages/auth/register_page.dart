import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bank_nordik/presentation/shared/FormRegisterWidget.dart';
import 'package:bank_nordik/presentation/shared/button.dart';
import 'package:bank_nordik/presentation/shared/const.dart';
import 'package:bank_nordik/presentation/shared/theme.dart';

import '../../bloc/auth/registration_bloc.dart';
import '../../shared/RegisterHeader.dart';
import 'register_upload_pic.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static const routeName = "/registerPage";

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    fullName.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const RegisterHeader(
                upperText: "Join Us to Unlock",
                lowerText: "Your Growth",
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
                    FormRegisterWidget(controller: fullName, name: "Full Name"),
                    FormRegisterWidget(controller: email, name: "Email"),
                    FormRegisterWidget(
                      controller: password,
                      name: "Password",
                      isPassword: true,
                    ),
                    SizedBox(
                      height: deviceHeight * 0.02,
                    ),
                    BlocConsumer<RegistrationCubit, RegistrationState>(
                      listener: (context, state) {
                        if (state is EmailNotValid) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Email already exists'),
                            ),
                          );
                        } else if (state is EmailValid) {
                          context.read<RegistrationCubit>().submitRegisterData(
                                fullName.text,
                                email.text,
                                password.text,
                              );
                          Navigator.of(context)
                              .pushNamed(RegisterUploadPic.routeName);
                        }
                      },
                      builder: (context, state) {
                        return CustomFilledButton(
                          title: "Continue",
                          onPressed: () async {
                            await context
                                .read<RegistrationCubit>()
                                .emailCheck(email.text);
                          },
                        );
                      },
                    ),
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
