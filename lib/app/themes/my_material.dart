// Copyright(c) 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style license.

import 'package:base_riverpod/app/themes/my_materialtext_theme.dart';
import 'package:flutter/material.dart';

final materialTheme = ThemeData(
      primarySwatch: Colors.purple,
      visualDensity:  VisualDensity.adaptivePlatformDensity,
      textTheme: myMaterialTextTheme
    );

final materialDarkTheme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.teal,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: myMaterialTextTheme
    );