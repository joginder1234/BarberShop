import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemeProvider {
  static TextStyle heading0 =
      GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.w700);
  static TextStyle heading1 =
      GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600);
  static TextStyle heading2 =
      GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600);
  static TextStyle heading3 =
      GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500);
  static TextStyle bodyText =
      GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400);
  static TextStyle bodyTextSmall =
      GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400);
  static TextStyle bodyTextSecondary =
      GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500);
  static TextStyle helperText =
      GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w500);
}
