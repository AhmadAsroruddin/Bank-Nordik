import 'package:bank_nordik/data/model/login_model.dart';
import 'package:bank_nordik/presentation/bloc/user_bloc.dart';
import 'package:bank_nordik/presentation/shared/const.dart';
import 'package:bank_nordik/presentation/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/pin_button.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});
  static const routeName = "/PinPage";

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final TextEditingController pinController = TextEditingController(text: '');
  String pin = '';

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      LoginModel? userData = await context.read<UserBloc>().getUserData();
      setState(() {
        pin = userData!.pin;
      });
    });
  }

  void addPin(String number) {
    if (pinController.text.length < 6) {
      setState(() {
        pinController.text = pinController.text + number;
      });
    }

    if (pinController.text.length == 6 && pinController.text == pin) {
      print("berhasil");
    }
  }

  void deletePin() {
    if (pinController.text.isNotEmpty) {
      setState(() {
        pinController.text =
            pinController.text.substring(0, pinController.text.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        decoration: const BoxDecoration(color: Colors.black),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.1),
            child: Column(
              children: [
                Text(
                  "Sha PIN",
                  style: whiteTextStyle.copyWith(
                    fontSize: deviceWidth * 0.06,
                    fontWeight: bold,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.1,
                ),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    controller: pinController,
                    obscureText: true,
                    cursorColor: greyColor,
                    obscuringCharacter: '*',
                    enabled: false,
                    style: whiteTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: medium,
                      letterSpacing: 16,
                    ),
                    decoration: InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: greyColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.1,
                ),
                Wrap(
                  spacing: deviceWidth * 0.1,
                  runSpacing: deviceHeight * 0.05,
                  children: [
                    PinButton(
                      number: "1",
                      onTap: () {
                        addPin('1');
                      },
                    ),
                    PinButton(
                      number: "2",
                      onTap: () {
                        addPin('2');
                      },
                    ),
                    PinButton(
                      number: "3",
                      onTap: () {
                        addPin('3');
                      },
                    ),
                    PinButton(
                      number: "4",
                      onTap: () {
                        addPin('4');
                      },
                    ),
                    PinButton(
                      number: "5",
                      onTap: () {
                        addPin('5');
                      },
                    ),
                    PinButton(
                      number: "6",
                      onTap: () {
                        addPin('6');
                      },
                    ),
                    PinButton(
                      number: "7",
                      onTap: () {
                        addPin('7');
                      },
                    ),
                    PinButton(
                      number: "8",
                      onTap: () {
                        addPin('8');
                      },
                    ),
                    PinButton(
                      number: "9",
                      onTap: () {
                        addPin('9');
                      },
                    ),
                    Container(
                      width: deviceWidth * 0.16,
                    ),
                    PinButton(
                      number: "0",
                      onTap: () {
                        addPin('0');
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        deletePin();
                      },
                      child: CircleAvatar(
                        maxRadius: deviceWidth * 0.08,
                        backgroundColor: const Color.fromRGBO(26, 29, 46, 1.0),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          weight: 10,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
