// Copyright(c) 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style license.

import 'package:base_riverpod/app/themes/my_materialtext_theme.dart';
import 'package:flutter/material.dart';

final materialTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.purple,
      visualDensity:  VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.deepPurple,
      textTheme: myMaterialTextTheme
    );

final materialDarkTheme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.indigo,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.indigoAccent,
      textTheme: myMaterialTextTheme
    );