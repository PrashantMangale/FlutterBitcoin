import 'package:fluttertoast/fluttertoast.dart';

class MsgController {
  static showMessage(String message) {
    return Fluttertoast.showToast(
        msg: message, toastLength: Toast.LENGTH_SHORT);
  }
}
