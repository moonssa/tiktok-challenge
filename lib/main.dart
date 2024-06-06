import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok_challenge/features/signup_screen.dart';
import 'package:tiktok_challenge/theme/tk_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OnBoarding',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF4e98e9),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        textTheme: AppTextTheme.textTheme,
        useMaterial3: true,
      ),
      home: const SignUpScreen(),
    );
  }
}
