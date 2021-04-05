// Copyright(c) 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style license.


import 'package:base_riverpod/app/modules/homepage/views/my_homepage_exp.dart';
import 'package:base_riverpod/app/themes/my_cupertino.dart';
import 'package:base_riverpod/app/themes/my_material.dart';
import 'package:base_riverpod/app/utils/logging/init_log.dart';
import 'package:base_riverpod/app/utils/logging/log_pens.dart';
import 'package:base_riverpod/app/utils/logging/logger_types.dart';


import 'package:catcher/catcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class MyPlatformExperience extends StatelessWidget with UiLogger {
  @override
  Widget build(BuildContext context) {
    logger.info(penInfo("platformApp built"));
    return Theme(
      data: brightness == Brightness.light ? materialTheme : materialDarkTheme,
      child: PlatformProvider(
        // note: I use the default setting of material for the web platform
        builder: (BuildContext context) => PlatformApp(
            // ignore: prefer_const_literals_to_create_immutables
            localizationsDelegates: <LocalizationsDelegate<dynamic>>[
              DefaultMaterialLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
            ],
            navigatorKey: Catcher.navigatorKey,
            // so I have nice screenshots for my dev articles

            debugShowCheckedModeBanner: false,
            title: 'Counter Example',
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
            home: MyHomePage()),
            // temp setting until I get a real iOS simulator
            // as any debug button or panel will detract from seeing full 
            // UI in debug mode which I despise. Much easier to uncomment this 
            // when I need to see the iOS UI.
            initialPlatform: TargetPlatform.iOS,
      ),
    );
  }
}
