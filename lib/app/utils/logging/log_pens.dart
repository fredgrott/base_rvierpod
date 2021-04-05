// Copyright(c) 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style license.

import 'package:ansicolor/ansicolor.dart';



final penFinest = AnsiPen()
  ..white(bold: true)
  ..rgb(r: 0, g: 0, b: 153, bg: true);
final penFiner = AnsiPen()
  ..black(bold: true)
  ..rgb(r: 255, g: 255, b: 255, bg: true);
final penFine = AnsiPen()
  ..magenta(bold: true)
  ..rgb(r: 0, g: 0, b: 102, bg: true);
final penInfo = AnsiPen()
  ..cyan(bold: true)
  ..black(bg: true);
final penConfig = AnsiPen()
  ..blue(bold: true)
  ..red(bg: true);
final penWarning = AnsiPen()
  ..yellow(bold: true)
  ..black(bg: true);
final penSevere = AnsiPen()
  ..green(bold: true)
  ..rgb(r: 0, g: 51, b: 0, bg: true);
final penShout = AnsiPen()
  ..red(bold: true)
  ..black(bg: true);
