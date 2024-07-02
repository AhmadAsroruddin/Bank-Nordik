import 'dart:io';

import 'package:bank_nordik/presentation/bloc/registration_bloc.dart';
import 'package:bank_nordik/presentation/pages/auth/register_upload_ktp.dart';
import 'package:bank_nordik/presentation/shared/FormRegisterWidget.dart';
import 'package:bank_nordik/presentation/shared/RegisterHeader.dart';
import 'package:bank_nordik/presentation/shared/button.dart';
import 'package:bank_nordik/presentation/shared/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/theme.dart';

// ignore: must_be_immutable
class RegisterUploadPic extends StatefulWidget {
  const RegisterUploadPic({super.key});
  static const routeName = "/registerUploadPic";

  @override
  State<RegisterUploadPic> createState() => _RegisterUploadPicState();
}

class _RegisterUploadPicState extends State<RegisterUploadPic> {
  TextEditingController pin = TextEditingController();
  XFile? image;

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
                    const RegisterHeader(
                      upperText: "Join Us to Unlock",
                      lowerText: "Your Growth",
                    ),
                    Container(
                      width: deviceWidth * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: deviceHeight * 0.02,
                          ),
                          GestureDetector(
                            onTap: () async {
                              final ImagePicker imagePicker = ImagePicker();
                              final pickedImage = await imagePicker.pickImage(
                                  source: ImageSource.gallery);
                              if (pickedImage != null) {
                                setState(() {
                                  image = pickedImage;
                                });
                              }
                            },
                            child: ClipOval(
                              child: Container(
                                padding: EdgeInsets.zero,
                                width: deviceWidth * 0.4,
                                height: deviceHeight * 0.175,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: image != null
                                        ? FileImage(File(image!.path))
                                            as ImageProvider
                                        : const AssetImage(
                                            "assets/add_photo.png",
                                          ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            state.registerModel.name!,
                            style: GoogleFonts.poppins().copyWith(
                                fontWeight: medium,
                                fontSize: deviceWidth * 0.045),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: deviceHeight * 0.03,
                              bottom: deviceHeight * 0.05,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: deviceWidth * 0.08),
                            child: Column(
                              children: <Widget>[
                                FormRegisterWidget(
                                  controller: pin,
                                  name: "Set PIN (6 digit number)",
                                ),
                                CustomFilledButton(
                                  title: "Continue",
                                  onPressed: () {
                                    print(image!.path.toString());
                                    context
                                        .read<RegistrationCubit>()
                                        .submitRegisterDataWithPhoto(
                                            state.registerModel.name!,
                                            state.registerModel.email!,
                                            state.registerModel.password!,
                                            image!.path.toString(),
                                            pin.text);
                                    Navigator.of(context)
                                        .pushNamed(UploadKtp.routeName);
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const Text("data");
            }
          },
        ),
      ),
    );
  }
}
