import 'package:fluttertoast/fluttertoast.dart';
import 'package:task/src/core/constant/color.dart';

class Toast {
  static showToast({required String text}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: text,
      backgroundColor: baseColor,
      textColor: kwhiteColor,
    );
  }
}
