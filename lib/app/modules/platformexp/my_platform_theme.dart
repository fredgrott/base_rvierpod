// Copyright(c) 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style license.

import 'package:base_riverpod/app/modules/homepage/my_homepage.dart';
import 'package:base_riverpod/app/themes/my_cupertino.dart';
import 'package:base_riverpod/app/themes/my_material.dart';

import 'package:flutter/cupertino.dart'
    show
        // ignore: unused_shown_name
        CupertinoActionSheet,
        // ignore: unused_shown_name
        CupertinoActionSheetAction,
        // ignore: unused_shown_name
        CupertinoDynamicColor,
        // ignore: unused_shown_name
        CupertinoIcons,
        // ignore: unused_shown_name
        CupertinoThemeData,
        DefaultCupertinoLocalizations;
import 'package:flutter/material.dart'
    show
        // ignore: unused_shown_name
        Colors,
        DefaultMaterialLocalizations,
        // ignore: unused_shown_name
        Icons,
        Theme,
        // ignore: unused_shown_name
        ThemeData,
        ThemeMode;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class MyPlatformTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Theme(
      data: brightness == Brightness.light ? materialTheme : materialDarkTheme,
      child: PlatformProvider(
        //initialPlatform: initialPlatform,
        // settings: PlatformSettingsData(
        //   platformStyle: PlatformStyleData(
        //     web: PlatformStyle.Cupertino,
        //   ),
        // ),
        builder: (BuildContext context) => PlatformApp(
          // ignore: prefer_const_literals_to_create_immutables
          localizationsDelegates: <LocalizationsDelegate<dynamic>>[
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          title: 'Flutter Platform Widgets',
          material: (dynamic _, dynamic __) {
            return MaterialAppData(
              theme: materialTheme,
              darkTheme: materialDarkTheme,
              themeMode: brightness == Brightness.light
                  ? ThemeMode.light
                  : ThemeMode.dark,
            );
          },
          cupertino: (dynamic _, dynamic __) => CupertinoAppData(
            theme: cupertinoTheme,
          ),
          home: MyHomePage()
          ),
        ),
      
    );
  }
}
