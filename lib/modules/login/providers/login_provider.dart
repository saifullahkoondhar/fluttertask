import 'package:flutter/material.dart';
import 'package:fluttertask/modules/login/providers/auth_provider.dart';
import 'package:fluttertask/services/connectivity_service.dart';
import 'package:fluttertask/widgets/custom_notification_message.dart';
import 'package:provider/provider.dart';

class LoginProvider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = true;
  bool isLoginLoading = false;

  String? validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter your user id/email';
    }
    return null;
  }

  String? validatePassword(value) {
    if (value!.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  bool togglePasswordVisibility() {
    notifyListeners();
    return isPasswordVisible = !isPasswordVisible;
  }

  void login(
    GlobalKey<FormState> formKey,
    String? email,
    String? password,
    BuildContext context,
  ) async {
    // Form validation
    if (formKey.currentState!.validate()) {
      ConnectivityService connectionservice = ConnectivityService();
      // Hide keyboard
      FocusScope.of(context).unfocus();
      isLoginLoading = true;
      notifyListeners();
      // Check internet connectivity
      if (await connectionservice.isConnected()) {
        // Credentials Object
        var credentials = {
          'userName': email?.trim() ?? '',
          'password': password?.trim() ?? '',
        };
        try {
          if (!context.mounted) return;
          var authProvider = Provider.of<AuthProvider>(context, listen: false);
          bool success = await authProvider.authenticate(credentials, context);
          if (success) {
            if (!context.mounted) return;
            customNotificationMessage('Login Success', true, context);
            Navigator.of(context).pushReplacementNamed('/home');
            isLoginLoading = false;
            notifyListeners();
          } else {
            isLoginLoading = false;
            notifyListeners();
          }
        } catch (err) {
          if (!context.mounted) return;
          customNotificationMessage(err.toString(), false, context);
          isLoginLoading = false;
          notifyListeners();
        }
      } else {
        if (!context.mounted) return;
        customNotificationMessage(
            'No Internet Connection Available', false, context);
        isLoginLoading = false;
        notifyListeners();
      }
    }
  }
}
