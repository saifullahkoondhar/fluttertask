import 'package:flutter/material.dart';

Widget customSpace(double spaceSize, {bool isHorizontalSpace = false}) {
  return SizedBox(
    height: isHorizontalSpace ? 0 : spaceSize,
    width: isHorizontalSpace ? spaceSize : 0,
  );
}
