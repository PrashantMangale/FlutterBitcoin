import 'package:flutter/cupertino.dart';

class ResponsiveUI {
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
