import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Single source of truth for the app's typography using Google Fonts.
/// Change the Google Font here in one place to update the entire application!
class AppFont {
  AppFont._();

  /// The active Google Font (change e.g. to GoogleFonts.poppins, GoogleFonts.urbanist, etc.)
  static TextStyle Function({
    TextStyle? textStyle,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) get font => GoogleFonts.inter;

  /// Global TextTheme for MaterialApp/ThemeData
  static TextTheme textTheme([TextTheme? base]) =>
      GoogleFonts.interTextTheme(base);

  /// Convenient helper to get a TextStyle with the active Google Font
  static TextStyle style({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
    TextStyle? textStyle,
  }) {
    return font(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
      textStyle: textStyle,
    );
  }
}
