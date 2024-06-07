import 'package:bank_nordik/presentation/shared/const.dart';
import 'package:bank_nordik/presentation/shared/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../shared/button.dart';
import '../../shared/circle_dot.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key, required this.onGetStarted});

  final Function() onGetStarted;

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currIndex = 0;
  CarouselController carouselController = CarouselController();

  List<String> subtitles = [
    "Our system is helping you to\nachieve a better goal",
    "We provide tips for you so that\nyou can adapt easier",
    "We will guide you to where you wanted it too"
  ];

  List<String> titles = [
    "Grow Your\nFinancial Today",
    "Build From Zero to Freedom",
    "Start Together"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider(
                items: [
                  Image.asset(
                    'assets/onboarding_1.png',
                    height: deviceHeight * 0.02,
                  ),
                  Image.asset(
                    'assets/onboarding_2.png',
                    height: deviceHeight * 0.02,
                  ),
                  Image.asset(
                    'assets/onboarding_3.png',
                    height: deviceHeight * 0.02,
                  )
                ],
                options: CarouselOptions(
                  height: 331,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currIndex = index;
                    });
                  },
                ),
                carouselController: carouselController,
              ),
              SizedBox(
                height: deviceHeight * 0.1,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: deviceWidth * 0.05,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: deviceWidth * 0.05,
                  vertical: deviceHeight * 0.04,
                ),
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1), // Shadow color
                        spreadRadius: 5, // Spread radius
                        blurRadius: 7, // Blur radius
                        offset: const Offset(0, 3), // Offset of the shadow
                      ),
                    ]),
                child: Column(
                  children: <Widget>[
                    Text(
                      titles[currIndex],
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Text(
                      subtitles[currIndex],
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: deviceHeight * 0.08,
                    ),
                    currIndex == 2
                        ? Column(
                            children: [
                              CustomFilledButton(
                                title: 'Get Started',
                                onPressed: widget.onGetStarted,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextButton(
                                title: 'Sign In',
                                onPressed: () {},
                              ),
                            ],
                          )
                        : Row(
                            children: <Widget>[
                              CircleDot(
                                currIndex: currIndex,
                                number: 0,
                              ),
                              CircleDot(
                                currIndex: currIndex,
                                number: 1,
                              ),
                              CircleDot(
                                currIndex: currIndex,
                                number: 2,
                              ),
                              const Spacer(),
                              CustomFilledButton(
                                title: 'Continue',
                                width: 150,
                                onPressed: () {
                                  carouselController.nextPage();
                                },
                              ),
                            ],
                          )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
