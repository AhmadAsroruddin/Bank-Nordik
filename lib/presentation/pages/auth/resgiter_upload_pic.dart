import 'package:bank_nordik/presentation/bloc/registration_bloc.dart';
import 'package:bank_nordik/presentation/shared/RegisterHeader.dart';
import 'package:bank_nordik/presentation/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/theme.dart';

class RegisterUploadPic extends StatelessWidget {
  const RegisterUploadPic({super.key});
  static const routeName = "/registerUploadPic";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: SafeArea(
        child: BlocBuilder<RegistrationCubit, RegistrationState>(
          builder: (context, state) {
            if (state is RegistrationData) {
              return Center(
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
                          Container(
                            width: deviceWidth * 0.3,
                            height: deviceHeight * 0.2,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/add_photo.png",
                                ),
                              ),
                            ),
                          ),
                          Text(state.fullName)
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Text("data");
            }
          },
        ),
      ),
    );
  }
}
