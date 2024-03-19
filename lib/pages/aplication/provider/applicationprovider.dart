import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'applicationprovider.g.dart';

@riverpod
class PageIndex extends _$PageIndex {
  @override
  int build() {
    return 0;
  }

  void setindex(int index) {
    state = index;
    if (kDebugMode) {
      print("current index $state");
    }
  }
}
