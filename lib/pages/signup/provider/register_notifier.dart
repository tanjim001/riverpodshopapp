import 'package:elearnapp/pages/signup/provider/register_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'register_notifier.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier {
  @override
  RegisterState build() {
    return RegisterState();
  }
  void onusernameupdate(String name){
    state=state.copyWith(userName:name);
  }
    void onuseremailupdate(String name){
    state=state.copyWith(email:name);
  }
    void onpasswordupdate(String name){
    state=state.copyWith(password: name);
  }

    void onrepasswordupdate(String name){
    state=state.copyWith(rePassword: name);
  }

}
