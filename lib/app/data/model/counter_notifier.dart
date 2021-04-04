// Copyright(c) 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style license.


import 'package:base_riverpod/app/utils/logging/my_log_env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CounterNotifier extends StateNotifier<CounterModel> with LogMixin {
  CounterNotifier() : super(_initialValue);

  static const _initialValue = CounterModel(0);

  void increment() {
    state = CounterModel(state.count + 1);
    // log our state change
    myAppLog("count increased by 1");
  }
}

class CounterModel {
  const CounterModel(this.count);
  final int count;
}
