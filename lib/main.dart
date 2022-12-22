import 'package:flutter/material.dart';
import 'package:mini_theater/utils/colors.dart';
import 'package:mini_theater/views/splash_screen/splash_screen.dart';

//API Key : 79e1826269e1778d2c8f71432872d647

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      home: const SplashScreen(),
    );
  }
}
