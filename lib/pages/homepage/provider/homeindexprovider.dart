import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'homeindexprovider.g.dart';
@Riverpod(keepAlive: true)
class Homeindex extends _$Homeindex {
  @override
  int build() {
    return 0;
  }
  void setindex( int index){
    state=index;
  }
}