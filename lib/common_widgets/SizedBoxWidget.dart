import 'package:flutter/cupertino.dart';

enum SizedBoxType { widthOnly, heightOnly, both }

class SizedBoxWidget {
  static SizedBox getSizeBox(SizedBoxType type, double size) {
    switch (type) {
      case SizedBoxType.widthOnly:
        return SizedBox(width: size);
      case SizedBoxType.heightOnly:
        return SizedBox(height: size);
      case SizedBoxType.both:
        return SizedBox(width: size, height: size);
    }
  }
}
