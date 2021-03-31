
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(title: PlatformText('Counter example')),
      body: Column(
        // ignore: avoid_redundant_argument_values
        
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
            Center(
              // Consumer is a widget that allows you reading providers.
              // You could also use the hook "useProvider" if you uses flutter_hooks
              child: Consumer(builder: (context, watch, _) {
                final dynamic count = watch(counterProvider).state;
                return PlatformText('$count');
              }),
            ),
            // changed so that I could make it fully cross platform as CupertinoApp does not have FABs
            Center(child: PlatformIconButton(
              
              onPressed: () => context.read(counterProvider).state++,
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
