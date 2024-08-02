import 'package:flutter/material.dart';
import 'package:fluttertask/helpers/app_theme.dart';
import 'package:loading_indicator/loading_indicator.dart';

Widget customLoading(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return SizedBox(
    height: size.height * 0.06,
    width: size.height * 0.06,
    child: const LoadingIndicator(
      indicatorType: Indicator.ballRotateChase,
      colors: [
        AppTheme.secondaryColor,
        Colors.white,
      ],
      strokeWidth: 1,
      backgroundColor: Colors.transparent,
      pathBackgroundColor: Colors.black,
    ),
  );
}
