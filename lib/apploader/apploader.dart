import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'apploader.g.dart';

@riverpod
class Apploader extends _$Apploader {
  @override
  bool build() {
    return false;
  }

  void setloader(bool value) {
    state = value;
  }
}
