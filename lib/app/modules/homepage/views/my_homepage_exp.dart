
import 'dart:developer';

import 'package:base_riverpod/app/data/model/counter_notifier.dart';
import 'package:base_riverpod/app/themes/my_cupertinonavigationbardata.dart';
import 'package:base_riverpod/app/themes/my_cupertinopagescaffolddata.dart';
import 'package:base_riverpod/app/themes/my_materialappbardata.dart';
import 'package:base_riverpod/app/themes/my_materialscaffolddata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final provider = StateNotifierProvider((ref) => CounterNotifier());

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      material: (_,__,)=> myMaterialScaffoldData,
      cupertino: (_,__,)=> myCupertinoPageScaffoldData,
      appBar: PlatformAppBar(title: PlatformText('Counter example'),
      material: (_, __,) => myMaterialAppBarData,
      cupertino: (_, __) => myCupertinoNavigationBarData,),
      body: Column(
        // ignore: avoid_redundant_argument_values
        
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
            PlatformText('You have pushed the button this many times:'),
            const CounterTextWidget(),
            // changed so that I could make it fully cross platform as CupertinoApp does not have FABs
            Center(child: PlatformIconButton(
              
              onPressed: () => context.read(provider).increment(),
              materialIcon: const Icon(Icons.add),
              cupertinoIcon: const Icon(
                 CupertinoIcons.add,
                 size: 28.0,
               ),
            )),
          ],
      )
    );
  }
}

class CounterTextWidget extends HookWidget {
  const CounterTextWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    log('building CounterTextWidget');
    final dynamic counterModel = useProvider(provider.state);
    return Text(
      '${counterModel.count}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}