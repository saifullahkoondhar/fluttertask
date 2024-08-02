import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/helpers/app_theme.dart';
import 'package:fluttertask/helpers/constants.dart';
import 'package:fluttertask/modules/home/screens/home_screen.dart';
import 'package:fluttertask/modules/login/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'modules/login/providers/login_provider.dart';
import 'modules/login/screens/login_screen.dart';

void main() async {
  // Checking for the access token
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString(Constants.token) ?? '';
  runApp(MyApp(
    token: token,
  ));
}

class MyApp extends StatelessWidget {
  final String token;
  const MyApp({
    super.key,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nexime',
        theme: AppTheme.themeData,
        routes: {
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
        },
        home: AnimatedSplashScreen(
          duration: 100,
          splash: Center(
            child: Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.contain,
            ),
          ),
          splashIconSize: 250,
          centered: true,
          splashTransition: SplashTransition.rotationTransition,
          animationDuration: const Duration(milliseconds: 850),
          nextRoute: token.isEmpty ? '/login' : '/home',
          nextScreen: token.isEmpty ? const LoginScreen() : const HomeScreen(),
        ),
      ),
    );
  }
}
