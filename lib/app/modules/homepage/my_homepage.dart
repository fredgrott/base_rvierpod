import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Providers are declared globally and specifies how to create a state
final counterProvider = StateProvider((ref) => 0);

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Counter example')),
        body: Column(
          // ignore: avoid_redundant_argument_values
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              // Consumer is a widget that allows you reading providers.
              // You could also use the hook "useProvider" if you uses flutter_hooks
              child: Consumer(builder: (context, watch, _) {
                final count = watch(counterProvider).state;
                return Text('$count');
              }),
            ),
            // changed so that I could make it fully cross platform as CupertinoApp does not have FABs
            Center(child: IconButton(
              icon: const Icon(
                Icons.add,
              ),
              iconSize: 50,
              color: Colors.green,
              splashColor: Colors.purple,
              onPressed: () => context.read(counterProvider).state++,
            )),
          ],
        ));
  }
}
