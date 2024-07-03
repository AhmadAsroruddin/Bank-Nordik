import 'dart:convert';
import 'dart:io';

import 'package:bank_nordik/presentation/bloc/auth/registration_bloc.dart';
import 'package:bank_nordik/presentation/shared/RegisterHeader.dart';
import 'package:bank_nordik/presentation/shared/button.dart';
import 'package:bank_nordik/presentation/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/theme.dart';

class UploadKtp extends StatefulWidget {
  const UploadKtp({super.key});
  static const routeName = "/upload-ktp";

  @override
  State<UploadKtp> createState() => _UploadKtpState();
}

class _UploadKtpState extends State<UploadKtp> {
  XFile? image;
  String? base64String;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<RegistrationCubit, RegistrationState>(
          builder: (context, state) {
            if (state is RegistrationData) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const RegisterHeader(
                      upperText: "Verify Your",
                      lowerText: "Account",
                    ),
                    Container(
                      width: deviceWidth * 0.9,
                      padding: EdgeInsets.all(deviceWidth * 0.08),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () async {
                              final ImagePicker imagePicker = ImagePicker();
                              final pickedImage = await imagePicker.pickImage(
                                  source: ImageSource.gallery);
                              if (pickedImage != null) {
                                setState(() {
                                  image = pickedImage;
                                  base64String =
                                      'data:image/png;base64,${base64Encode(File(image!.path).readAsBytesSync())}';
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
                          SizedBox(
                            height: deviceHeight * 0.02,
                          ),
                          Text(
                            "Passport/ID Card",
                            style: GoogleFonts.poppins().copyWith(
                              fontWeight: medium,
                              fontSize: deviceWidth * 0.045,
                            ),
                          ),
                          SizedBox(
                            height: deviceHeight * 0.08,
                          ),
                          CustomFilledButton(
                            title: "Continue",
                            onPressed: () {
                              if (image == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text(
                                        'you have not upload image yet'),
                                    duration: const Duration(seconds: 4),
                                    action: SnackBarAction(
                                      label: 'Hide',
                                      onPressed: () {},
                                    ),
                                  ),
                                );
                              } else {
                                context
                                    .read<RegistrationCubit>()
                                    .submitRegisterDataFull(
                                        state.registerModel.name!,
                                        state.registerModel.email!,
                                        state.registerModel.password!,
                                        state.registerModel.profilePicture!,
                                        base64String!,
                                        state.registerModel.pin!);
                              }
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight * 0.05,
                    ),
                    Text(
                      "Skip For Now",
                      style: GoogleFonts.poppins().copyWith(
                        color: greyColor,
                        fontSize: deviceWidth * 0.04,
                      ),
                    ),
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
