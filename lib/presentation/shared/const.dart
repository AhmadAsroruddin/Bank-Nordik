import 'package:flutter/cupertino.dart';

final double deviceWidth = MediaQueryData.fromView(
        WidgetsBinding.instance.platformDispatcher.views.single)
    .size
    .width;
final double deviceHeight = MediaQueryData.fromView(
        WidgetsBinding.instance.platformDispatcher.views.single)
    .size
    .height;
