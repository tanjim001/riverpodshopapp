import 'package:elearnapp/pages/signinpage/provider/signin_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signin_notifier.g.dart';
@riverpod
class SignInNotifier extends _$SignInNotifier {
  @override
  SignInState build() {
    return SignInState();
  }
    void onuseremailupdate(String name){
    state=state.copyWith(email:name);
  }
    void onpasswordupdate(String name){
    state=state.copyWith(password: name);
  }
}