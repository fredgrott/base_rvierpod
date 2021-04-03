// Copyright(c) 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style license.

import 'package:flutter/material.dart';

// note for CupertinoApp I have to transform 
// these color settings to CupertinoColorDynamic stuff 
// as when brightness changes than the dynamic 
// block should set the color to the dark or light version

const Color myPrimaryColor = Color(0xff6200ee);
const Color myPrimaryVariantColor = Color(0xff3700b3);
const Color mySecondaryColor = Color(0xff3F51B5);
const Color mySecondaryVariantColor = Color(0xff8C9eff);
const Color myErrorColor = Color(0xffb00020);
const Color myBarBackgroundColor = Color(0xff6200ee);
const Color myScaffoldBackgroundColor = Color(0xff3700b3);

// ignore: constant_identifier_names
const ColorScheme MyColorScheme = ColorScheme(
    primary: myPrimaryColor,
    primaryVariant: myPrimaryVariantColor,
    secondary: mySecondaryColor,
    secondaryVariant: mySecondaryVariantColor,
    surface: Colors.white,
    background: Colors.white,
    error: myErrorColor,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light);

// Note: CupertinoThemeData only sets:
//         primaryColor                maps to primaryColor MD
//         primaryContrastingColor     maps to primaryVariant MD
//         barBackgroundColor          maps to backgroundColor AppBAr Theme MD
//         scaffoldBackgroundColor     maps to scaffold background color MD
//
//         and the type is Color from dart.ui
//
