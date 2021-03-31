

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Brightness brightness = Brightness.light;



final cupertinoTheme = CupertinoThemeData(
      brightness: brightness, // if null will use the system theme
      primaryColor: const CupertinoDynamicColor.withBrightness(
        color: Colors.purple,
        darkColor: Colors.cyan,
      ),
    );
