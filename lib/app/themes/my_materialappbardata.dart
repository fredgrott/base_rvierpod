// Copyright(c) 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style license.


import 'package:base_riverpod/app/themes/my_materialtext_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

MaterialAppBarData myMaterialAppBarData = MaterialAppBarData(
  textTheme: myMaterialTextTheme,
  // to adjust to iOS which defaults to title centered when no icons are present
  centerTitle: true,
  brightness: Brightness.light,
);