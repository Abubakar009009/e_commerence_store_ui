import 'package:flutter/material.dart';

class GetScreenSize {
  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double getScreenWidth(BuildContext context) {
    if (MediaQuery.of(context).size.width > 1200) {
      return MediaQuery.of(context).size.width / 3;
    }
    if (MediaQuery.of(context).size.width > 850 &&
        MediaQuery.of(context).size.width < 1200) {
      return MediaQuery.of(context).size.width / 2;
    }
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    if (MediaQuery.of(context).size.height > 1200) {
      return MediaQuery.of(context).size.height / 3;
    }
    if (MediaQuery.of(context).size.height > 500 &&
        MediaQuery.of(context).size.height < 800) {
      return MediaQuery.of(context).size.height / 2;
    }
    return MediaQuery.of(context).size.height;
  }

  static Orientation getScreenOrienation(BuildContext context) {
    return MediaQuery.of(context).orientation;
  }
}
