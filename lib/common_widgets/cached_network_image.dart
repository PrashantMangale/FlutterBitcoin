import 'package:flutter/material.dart';

class CachedNetworkImage {
  static Widget getNetworkImage(String imageUrl, double width, double height) {
    if (width != 0 && height != 0) {
      return Image.network(imageUrl, width: width, height: height);
    } else if (width != 0) {
      return Image.network(imageUrl, width: width);
    } else if (height != 0) {
      return Image.network(imageUrl, height: height);
    } else {
      return Image.network(imageUrl);
    }
  }
}
