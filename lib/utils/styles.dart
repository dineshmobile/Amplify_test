import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static TextStyle light(
      {@required double fontSize,
        Color color = Colors.black,
        double letterSpacing = 0.0}) =>
      GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.w300,
          color: color,
          letterSpacing: letterSpacing);

  static TextStyle regular(
      {@required double fontSize,
        Color color = Colors.black,
        double letterSpacing = 0.0}) =>
      GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
          color: color,
          letterSpacing: letterSpacing);

  static TextStyle medium(
      {@required double fontSize,
        Color color = Colors.black,
        double letterSpacing = 0.0}) =>
      GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: color,
          letterSpacing: letterSpacing);

  static TextStyle bold(
      {@required double fontSize,
        Color color = Colors.black,
        double letterSpacing = 0.0}) =>
      GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: color,
          letterSpacing: letterSpacing);
}
