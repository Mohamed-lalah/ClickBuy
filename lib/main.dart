import 'package:click_buy/ui/screens/auth/login/login_screen.dart';
import 'package:click_buy/ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        SplashScreen.routeName : (_)=> SplashScreen(),
        LoginScreen.routeName : (_)=> SplashScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}

