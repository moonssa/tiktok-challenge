import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok_challenge/features/signup_screen.dart';

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
        textTheme: TextTheme(
          displayLarge: GoogleFonts.openSans(
              fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
          displayMedium: GoogleFonts.openSans(
              fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
          displaySmall:
              GoogleFonts.openSans(fontSize: 48, fontWeight: FontWeight.w400),
          headlineLarge: GoogleFonts.openSans(
              fontSize: 36, fontWeight: FontWeight.w600, letterSpacing: 0.25),
          headlineMedium: GoogleFonts.poppins(
              fontSize: 30, fontWeight: FontWeight.w700, letterSpacing: -0.5),
          headlineSmall: GoogleFonts.openSans(
              fontSize: 28, fontWeight: FontWeight.w700, letterSpacing: -0.25),
          titleLarge: GoogleFonts.poppins(
              fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: 0.15),
          titleMedium: GoogleFonts.poppins(
              fontSize: 21, fontWeight: FontWeight.w700, letterSpacing: 0.15),
          titleSmall: GoogleFonts.poppins(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
          bodyLarge: GoogleFonts.roboto(
              fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.5),
          bodyMedium: GoogleFonts.roboto(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.25),
          labelLarge: GoogleFonts.roboto(
              fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 1.25),
          labelMedium: GoogleFonts.roboto(
              fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 1),
          bodySmall: GoogleFonts.roboto(
              fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
          labelSmall: GoogleFonts.roboto(
              fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
        ),
        useMaterial3: true,
      ),
      home: const SignUpScreen(),
    );
  }
}
