

import 'package:base_riverpod/app/themes/my_cupertinotext_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Brightness brightness = Brightness.light;



final cupertinoTheme = CupertinoThemeData(
      brightness: brightness, // if null will use the system theme
      primaryColor: const CupertinoDynamicColor.withBrightnessAndContrast(
        color: Colors.purple, 
        darkColor: Colors.indigo, 
        highContrastColor: Colors.indigoAccent, 
        darkHighContrastColor: Colors.indigo),
      primaryContrastingColor: const CupertinoDynamicColor.withBrightnessAndContrast(
        color: Colors.deepPurple, 
        darkColor: Colors.indigoAccent, 
        highContrastColor: Colors.indigo, 
        darkHighContrastColor: Colors.indigoAccent),
      scaffoldBackgroundColor: const CupertinoDynamicColor.withBrightnessAndContrast(
        color: Colors.white, 
        darkColor: Colors.grey, 
        highContrastColor: Colors.blueGrey, 
        darkHighContrastColor: Colors.black87),
      barBackgroundColor: const CupertinoDynamicColor.withBrightnessAndContrast(
        color: Colors.purple, 
        darkColor: Colors.indigo, 
        highContrastColor: Colors.indigoAccent, 
        darkHighContrastColor: Colors.indigo),
      textTheme: myCupertinoTextThemeData
    );
