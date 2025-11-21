   import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget showLoading(BuildContext context, Color color, double size) {
   return SpinKitSpinningLines(
      color: color,
      size: size,
    );
}
  
