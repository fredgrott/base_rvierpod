import 'package:flutter/material.dart';



// ignore: constant_identifier_names
const ColorScheme MyColorScheme = ColorScheme(
    primary: Color(0xff6200ee),
    primaryVariant: Color(0xff3700b3),
    secondary: Color(0xff03dac6),
    secondaryVariant: Color(0xff018786),
    surface: Colors.white,
    background: Colors.white,
    error: Color(0xffb00020),
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    onBackground:  Colors.black,
    onError: Colors.white,
    brightness: Brightness.light);

// Note: CupertinoThemeData only sets:
//         primaryColor
//         primaryContrastingColor
//         barBackgroundColor
//         scaffoldBackgroundColor
// 
//         and the type is Color from dart.ui 
// 