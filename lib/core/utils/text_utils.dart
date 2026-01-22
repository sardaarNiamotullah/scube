import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scube/core/themes/custom_theme.dart';

class TextUtils {
  static TextStyle title1({color, required context}) {
    return TextStyle(
      color: color ?? CustomTheme.of(context).black,
      fontSize: 23,
      fontFamily: GoogleFonts.lato().fontFamily,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle title2({color, required context}) {
    return TextStyle(
      color: color ?? CustomTheme.of(context).black,
      fontSize: 20,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle title3({color, required context}) {
    return TextStyle(
      color: color ?? CustomTheme.of(context).black,
      fontSize: 16,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle b1Regular({color, required context, lineHeight}) {
    return TextStyle(
      color: color ?? CustomTheme.of(context).black,
      fontSize: 13,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      height: lineHeight ?? 1.4,
    );
  }

  static TextStyle b1Bold({color, required context}) {
    return TextStyle(
      color: color ?? CustomTheme.of(context).black,
      fontSize: 13,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle b1SemiBold({color, required context}) {
    return TextStyle(
      color: color ?? CustomTheme.of(context).black,
      fontSize: 13,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle caption1({color, required context}) {
    return TextStyle(
      color: color ?? CustomTheme.of(context).black,
      fontSize: 12,
      fontFamily: GoogleFonts.montserrat().fontFamily,
    );
  }

  static TextStyle captionSemiBold({color, required context}) {
    return TextStyle(
      color: color ?? CustomTheme.of(context).black,
      fontSize: 12,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle b1Small({color, required context}) {
    return TextStyle(
      color: color ?? CustomTheme.of(context).black,
      fontSize: 10,
      fontFamily: GoogleFonts.montserrat().fontFamily,
    );
  }

  static TextStyle b1SmallBold({color, required context}) {
    return TextStyle(
      color: color ?? CustomTheme.of(context).black,
      fontSize: 10,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      fontWeight: FontWeight.bold,
    );
  }
}
