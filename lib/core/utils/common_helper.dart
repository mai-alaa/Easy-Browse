   import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget showLoading(BuildContext context, Color color, double size) {
   return SpinKitSpinningLines(
      color: color,
      size: size,
    );
}
  void showToast(String msg, Color? color) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }
