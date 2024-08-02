import 'package:flutter/material.dart';
import 'package:fluttertask/helpers/app_theme.dart';
import 'package:fluttertask/modules/login/providers/login_provider.dart';
import 'package:fluttertask/widgets/custom_loading.dart';
import 'package:fluttertask/widgets/custom_space.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Back layers for the background design
          _buildBackLayer(size),
          _buildUpperBackLayer(size),

          // Main login form
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.height * 0.06),
              child: Column(
                children: [
                  customSpace(size.height * 0.08),
                  _buildLogo(),
                  customSpace(size.height * 0.03),
                  _buildTitle(),
                  _buildDivider(size),
                  customSpace(size.height * 0.05),
                  _buildLoginForm(size, loginProvider, context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget for the back layer
  Widget _buildBackLayer(Size size) {
    return Positioned(
      top: size.height / 6.8,
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.borderColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(size.height / 4),
          ),
        ),
      ),
    );
  }

  // Widget for the upper back layer
  Widget _buildUpperBackLayer(Size size) {
    return Positioned(
      top: size.height / 5.8,
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(size.height / 3),
          ),
        ),
      ),
    );
  }

  // Widget for the logo
  Widget _buildLogo() {
    return Image.asset(
      'assets/icons/loginIcon.png',
      height: 150,
      width: 150,
      fit: BoxFit.contain,
    );
  }

  // Widget for the title
  Widget _buildTitle() {
    return const Text(
      'LOGIN ACCOUNT',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  // Widget for the divider
  Widget _buildDivider(Size size) {
    return Container(
      width: size.width / 2.2,
      height: 3,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.secondaryColor, Colors.transparent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }

  // Widget for the login form
  Widget _buildLoginForm(
      Size size, LoginProvider loginProvider, BuildContext context) {
    return Form(
      key: loginProvider.formKey,
      child: Column(
        children: [
          _buildEmailField(size, loginProvider),
          customSpace(size.height * 0.02),
          _buildPasswordField(size, loginProvider),
          _buildForgotPassword(),
          customSpace(size.height * 0.02),
          _buildLoginButton(size, loginProvider, context),
          customSpace(size.height * 0.01),
          _buildSignUpPrompt(),
          customSpace(size.height * 0.01),
          _buildOrDivider(size),
          customSpace(size.height * 0.02),
          _buildGoogleLoginButton(size),
          customSpace(size.height * 0.02),
          _buildFacebookLoginButton(size),
          customSpace(size.height * 0.02),
        ],
      ),
    );
  }

  // Widget for the email field
  Widget _buildEmailField(Size size, LoginProvider loginProvider) {
    return TextFormField(
      cursorColor: AppTheme.primaryColor,
      keyboardType: TextInputType.emailAddress,
      controller: loginProvider.emailController,
      enabled: !loginProvider.isLoginLoading,
      validator: loginProvider.validateEmail,
      decoration: InputDecoration(
        hintText: 'Enter your email',
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(Icons.email_outlined, color: Colors.grey.shade400),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: AppTheme.secondaryColor),
        ),
      ),
    );
  }

  // Widget for the password field
  Widget _buildPasswordField(Size size, LoginProvider loginProvider) {
    return TextFormField(
      cursorColor: AppTheme.primaryColor,
      keyboardType: TextInputType.text,
      controller: loginProvider.passwordController,
      obscureText: loginProvider.isPasswordVisible,
      enabled: !loginProvider.isLoginLoading,
      validator: loginProvider.validatePassword,
      decoration: InputDecoration(
        hintText: 'Enter your password',
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(Icons.lock_outline, color: Colors.grey.shade400),
        suffixIcon: GestureDetector(
          onTap: loginProvider.togglePasswordVisibility,
          child: Icon(
            loginProvider.isPasswordVisible
                ? Icons.visibility
                : Icons.visibility_off,
            color: Colors.grey.shade400,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: AppTheme.secondaryColor),
        ),
      ),
    );
  }

  // Widget for the forgot password button
  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {
          // Implement forgot password
        },
        child: const Text(
          'Forgot Password',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  // Widget for the login button
  Widget _buildLoginButton(
      Size size, LoginProvider loginProvider, BuildContext context) {
    return loginProvider.isLoginLoading
        ? customLoading(context)
        : ElevatedButton(
            onPressed: () {
              loginProvider.login(
                loginProvider.formKey,
                loginProvider.emailController.text,
                loginProvider.passwordController.text,
                context,
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: AppTheme.textColorWhite,
              backgroundColor: AppTheme.secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              fixedSize: Size(size.width * 0.8, size.height * 0.065),
            ),
            child: Text(
              'Sign In',
              style: AppTheme.textStyle.copyWith(
                color: AppTheme.textColorWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }

  // Widget for the sign-up prompt
  Widget _buildSignUpPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: AppTheme.textStyle.copyWith(color: AppTheme.textColorWhite),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Sign up",
            style: AppTheme.textStyle.copyWith(color: AppTheme.secondaryColor),
          ),
        ),
      ],
    );
  }

  // Widget for the "OR" divider
  Widget _buildOrDivider(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: Colors.white,
            thickness: 0.3,
            indent: size.width * 0.01,
          ),
        ),
        Text(
          "OR",
          style: AppTheme.textStyle.copyWith(color: AppTheme.textColorWhite),
        ),
        Expanded(
          child: Divider(
            color: Colors.white,
            thickness: 0.3,
            endIndent: size.width * 0.01,
          ),
        ),
      ],
    );
  }

  // Widget for the Google login button
  Widget _buildGoogleLoginButton(Size size) {
    return ElevatedButton.icon(
      icon: Image.asset(
        'assets/icons/google.png',
        height: 20,
        fit: BoxFit.contain,
      ),
      label: const Text('Sign in with Google'),
      onPressed: () {
        // Implement Google sign in
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        fixedSize: Size(size.width * 0.8, size.height * 0.065),
      ),
    );
  }

  // Widget for the Facebook login button
  Widget _buildFacebookLoginButton(Size size) {
    return ElevatedButton.icon(
      icon: Image.asset(
        'assets/icons/fb.png',
        height: 20,
        fit: BoxFit.contain,
      ),
      label: const Text('Sign in with Facebook'),
      onPressed: () {
        // Implement Facebook sign in
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        fixedSize: Size(size.width * 0.8, size.height * 0.065),
      ),
    );
  }
}
