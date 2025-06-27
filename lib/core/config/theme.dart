import 'package:flutter/material.dart';
import 'package:soand/core/config/colors.dart';
import 'package:soand/core/config/fonts.dart';

class AppTheme {
  ThemeData lightTheme() => ThemeData();

  ThemeData darkTheme() {
    final colors = AppColors();
    return ThemeData(
      scaffoldBackgroundColor: colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      extensions: [
        AppFonts(
          fontSize32Weight800: TextStyle(
            fontFamily: "Akatab",
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: colors.black,
          ),
          fontSize12Weight600: TextStyle(
            fontFamily: "Akatab",
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: colors.black,
          ),
          fontSize12Weight300: TextStyle(
            fontFamily: "Akatab",
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: colors.black,
          ),
          fontSize13Weight300: TextStyle(
            fontFamily: "Akatab",
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: colors.black,
          ),
          fontSize32Weight500: TextStyle(
            fontFamily: "Akatab",
            fontSize: 32,
            fontWeight: FontWeight.w400,
            color: colors.black,
          ),
          fontSize19Weight400: TextStyle(
            fontFamily: "Akatab",
            fontSize: 19,
            fontWeight: FontWeight.w400,
            color: colors.black,
          ),
          fontSize22Weight600: TextStyle(
            fontFamily: "Akatab",
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: colors.black,
          ),
          fontSize22Weight400: TextStyle(
            fontFamily: "Akatab",
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: colors.black,
          ),
          fontSize16Weight400: TextStyle(
            fontFamily: "Akatab",
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: colors.black,
          ),
          fontSize16Weight500: TextStyle(
            fontFamily: "Akatab",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: colors.black,
          ),
          fontSize16Weight600: TextStyle(
            fontFamily: "Akatab",
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: colors.black,
          ),
          fontSize16Weight700: TextStyle(
            fontFamily: "Akatab",
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: colors.black,
          ),
          fontSize14Weight400: TextStyle(
            fontFamily: "Akatab",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: colors.black,
          ),
          fontSize24Weight700: TextStyle(
            fontFamily: "Akatab",
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: colors.black,
          ),
          fontSize20Weight800: TextStyle(
            fontFamily: "Akatab",
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: colors.black,
          ),
          fontSize20Weight700: TextStyle(
            fontFamily: "Akatab",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: colors.black,
          ),
          fontSize20Weight500: TextStyle(
            fontFamily: "Akatab",
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: colors.black,
          ),
          fontSize20Weight400: TextStyle(
            fontFamily: "Akatab",
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: colors.black,
          ),
          fontSize18Weight700: TextStyle(
            fontFamily: "Akatab",
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: colors.black,
          ),
          fontSize18Weight600: TextStyle(
            fontFamily: "Akatab",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: colors.black,
          ),
          fontSize18Weight500: TextStyle(
            fontFamily: "Akatab",
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: colors.black,
          ),
          fontSize18Weight400: TextStyle(
            fontFamily: "Akatab",
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: colors.black,
          ),
          fontSize15Weight400: TextStyle(
            fontFamily: "Akatab",
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: colors.black,
          ),
          fontSize14Weight700: TextStyle(
            fontFamily: "Akatab",
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: colors.black,
          ),
          fontSize14Weight600: TextStyle(
            fontFamily: "Akatab",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: colors.black,
          ),
          fontSize14Weight500: TextStyle(
            fontFamily: "Akatab",
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: colors.black,
          ),
          fontSize12Weight500: TextStyle(
            fontFamily: "Akatab",
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: colors.black,
          ),
          fontSize12Weight400: TextStyle(
            fontFamily: "Akatab",
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: colors.black,
          ),
          fontSize10Weight400: TextStyle(
            fontFamily: "Akatab",
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: colors.black,
          ),
          fontSize8Weight400: TextStyle(
            fontFamily: "Akatab",
            fontSize: 8,
            fontWeight: FontWeight.w400,
            color: colors.black,
          ),
          fontSize30Weight700: TextStyle(
            fontFamily: "Akatab",
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: colors.black,
          ),
          fontSize20Weight600: TextStyle(
            fontFamily: "Akatab",
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: colors.black,
          ),
          fontSize7Weight600: TextStyle(
            fontFamily: "Akatab",
            fontSize: 7,
            fontWeight: FontWeight.w600,
            color: colors.black,
          ),
          fontSize24Weight400: TextStyle(
            fontFamily: "Akatab",
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: colors.black,
          ),
          fontSize13Weight400: TextStyle(
            fontFamily: "Akatab",
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: colors.black,
          ),
          fontSize24Weight500: TextStyle(
            fontFamily: "Akatab",
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: colors.black,
          ),
        ),
      ],
    );
  }
}
