import 'package:bank_nordik/presentation/pages/auth/login/signin_page.dart';
import 'package:bank_nordik/presentation/pages/auth/register/register_upload_ktp.dart';
import 'package:bank_nordik/presentation/pages/auth/register/register_upload_pic.dart';
import 'package:bank_nordik/presentation/pages/pin/pin_page.dart';
import 'package:flutter/material.dart';

import '../bloc/router_bloc.dart';
import '../pages/auth/register/register_page.dart';
import '../pages/splash_screen/onboard_page.dart';

class MyRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;

  MyRouterDelegate(this.routerCubit)
      : _navigatorKey = GlobalKey<NavigatorState>() {
    _init();
  }

  List<Page> historyStack = [];
  bool? isLoggedIn;
  bool? isFirstTime;
  final RouterCubit routerCubit;

  Future<void> _init() async {
    isFirstTime = await routerCubit.checkFirstTime();

    notifyListeners();
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(configuration) async {}

  @override
  Widget build(BuildContext context) {
    if (isFirstTime == null) {
      // Waiting for initialization
      return const CircularProgressIndicator(); // or some other loading indicator
    } else if (isFirstTime == true) {
      historyStack = _splashStack;
    } else {
      historyStack = _loggedOutStack;
    }

    return Navigator(
      key: navigatorKey,
      pages: historyStack,
      onGenerateRoute: (settings) {
        if (settings.name == RegisterPage.routeName) {
          return MaterialPageRoute(
            builder: (context) => const RegisterPage(),
            settings: settings,
          );
        }
        if (settings.name == RegisterUploadPic.routeName) {
          return MaterialPageRoute(
              builder: (context) => const RegisterUploadPic(),
              settings: settings);
        }
        if (settings.name == UploadKtp.routeName) {
          return MaterialPageRoute(
              builder: (context) => const UploadKtp(), settings: settings);
        }

        if (settings.name == SignInPage.routeName) {
          return MaterialPageRoute(
              builder: (context) => const SignInPage(), settings: settings);
        }
        if (settings.name == PinPage.routeName) {
          return MaterialPageRoute(
              builder: (context) => const PinPage(), settings: settings);
        }

        return null;
      },
      onPopPage: (route, result) {
        final didPop = route.didPop(result);
        if (!didPop) {
          return false;
        }

        notifyListeners();

        return true;
      },
    );
  }

  // ONBOARDING PAGE
  List<Page> get _splashStack => [
        MaterialPage(
          key: const ValueKey("SplashScreen"),
          child: OnBoardingPage(
            onGetStarted: () {
              routerCubit.firstTimeDone();
              isFirstTime = false;
              notifyListeners(); // Update state after getting started
            },
          ),
        ),
      ];

  // BEFORE LOGIN PAGE
  List<Page> get _loggedOutStack => [
        const MaterialPage(
          key: ValueKey("PinPage"),
          child: PinPage(),
        ),
        // const MaterialPage(
        //   key: ValueKey("RegisterUploadPic"),
        //   child: RegisterUploadPic(),
        // )
      ];
}
