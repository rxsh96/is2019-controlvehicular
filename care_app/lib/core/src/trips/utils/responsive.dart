import 'dart:math' as math;
import 'package:flutter/cupertino.dart';


class Responsive {

  Responsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    inch = math.sqrt(math.pow(size.width, 2) + math.pow(size.height, 2));
  }

  double inch;

  double ip(double percent) {
    return inch * percent / 100;
  }
}