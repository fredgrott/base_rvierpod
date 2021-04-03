// Copyright(c) 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style license.




import 'package:base_riverpod/app/modules/homepage/views/my_homepage_exp.dart';
import 'package:flutter/material.dart';


import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';


// ignore: long-method
void main() {
   WidgetsFlutterBinding.ensureInitialized();
  testGoldens('DeviceBuilder - one scenario - default devices', (tester) async {
    final builder = DeviceBuilder()
      ..addScenario(
        widget: MyHomePage(),
        name: 'default page',
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(tester, 'my_home_page_single_scenario');
  });

  testGoldens('DeviceBuilder - one scenario - override devices',
          // ignore: prefer-trailing-comma
          (tester) async {
        final builder = DeviceBuilder()
          ..overrideDevicesForAllScenarios(devices: [
            Device.phone,
            Device.iphone11,
            Device.tabletPortrait,
            Device.tabletLandscape,
          ])
          ..addScenario(
            widget: MyHomePage(),
            name: 'default page',
          );

        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(
            // ignore: prefer-trailing-comma
            tester, "my_home_page_single_scenario_more_devices");
      });

  testGoldens('DeviceBuilder - multiple scenarios - with onCreate',
          // ignore: prefer-trailing-comma
          (tester) async {
        final builder = DeviceBuilder()
          // ignore: prefer-trailing-comma
          ..overrideDevicesForAllScenarios(devices: [
            Device.phone,
            Device.iphone11,
            Device.tabletPortrait,
            Device.tabletLandscape,
          ])
          ..addScenario(
            widget: MyHomePage(),
            name: 'default page',
          )
          // ignore: prefer-trailing-comma
          ..addScenario(
            widget: MyHomePage(),
            name: 'tap once',
            onCreate: (scenarioWidgetKey) async {
              final finder = find.descendant(
                of: find.byKey(scenarioWidgetKey),
                matching: find.byIcon(Icons.add),
              );
              expect(finder, findsOneWidget);
              await tester.tap(finder);
            },
          )
          ..addScenario(
            widget: MyHomePage(),
            name: 'tap five times',
            onCreate: (scenarioWidgetKey) async {
              final finder = find.descendant(
                of: find.byKey(scenarioWidgetKey),
                matching: find.byIcon(Icons.add),
              );
              expect(finder, findsOneWidget);

              await tester.tap(finder);
              await tester.tap(finder);
              await tester.tap(finder);
              await tester.tap(finder);
              await tester.tap(finder);
            },
          );

        await tester.pumpDeviceBuilder(builder);

        // ignore: prefer-trailing-comma
        await screenMatchesGolden(tester, 'my_home_page_multiple_scenarios');
      });
}