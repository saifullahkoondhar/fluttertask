import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/helpers/app_theme.dart';

void customNotificationMessage(
  String? message,
  bool isSuccess,
  BuildContext context, {
  bool isInfo = false,
  String descriptionMessage = '',
}) {
  return isInfo
      ? CherryToast.info(
          title: Text(
            message ?? 'An error occurred!',
            style: AppTheme.textStyle
                .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          description: Text(
            descriptionMessage,
            style: AppTheme.textStyle.copyWith(
              fontSize: 12,
            ),
            textAlign: TextAlign.justify,
          ),
          inheritThemeColors: true,
          displayCloseButton: true,
          animationType: AnimationType.fromLeft,
          animationDuration: const Duration(milliseconds: 500),
          autoDismiss: false,
          enableIconAnimation: true,
          toastPosition: Position.center,
        ).show(context)
      : isSuccess
          ? CherryToast.success(
              title: Text(
                message ?? 'Success',
                style: AppTheme.textStyle,
              ),
              displayCloseButton: false,
              animationType: AnimationType.fromTop,
              animationDuration: const Duration(milliseconds: 500),
              toastDuration: const Duration(milliseconds: 2500),
              borderRadius: 30,
              autoDismiss: true,
              enableIconAnimation: true,
            ).show(context)
          : CherryToast.error(
              title: Text(
                message ?? 'An error occurred!',
                style: AppTheme.textStyle,
              ),
              displayCloseButton: false,
              animationType: AnimationType.fromTop,
              animationDuration: const Duration(milliseconds: 500),
              toastDuration: const Duration(milliseconds: 2500),
              borderRadius: 30,
              autoDismiss: true,
              enableIconAnimation: true,
            ).show(context);
}
