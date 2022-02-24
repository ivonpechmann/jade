import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
  fontFamily: GoogleFonts.nunitoSans().fontFamily,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
    bodyText2: TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
    headline4: TextStyle(
      color: Colors.white,
      fontSize: 38,
      fontWeight: FontWeight.w400
    )
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
  ),
  scaffoldBackgroundColor: Colors.black,
);

const TextStyle errorMessage = TextStyle(color: Colors.red);
const grayColor = Color.fromARGB(156, 54, 54, 54);
const purpleColor = Color.fromRGBO(52, 0, 135, 100);

