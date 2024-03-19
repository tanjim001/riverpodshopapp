// ignore_for_file: use_build_context_synchronously

import 'package:elearnapp/apploader/apploader.dart';
import 'package:elearnapp/commonwidget/toast.dart';
import 'package:elearnapp/pages/signup/provider/register_notifier.dart';
import 'package:elearnapp/pages/signup/repo/signuprepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpController {
  //final WidgetRef ref;

  //SignUpController({required this.ref});

  Future<void> handleSignup(WidgetRef ref) async {
    var state = ref.read(registerNotifierProvider);
    String name = state.userName;
    String email = state.email;
    String password = state.password;
    String repassword = state.rePassword;

    if (state.userName.length <= 5 || name.length <= 5) {
      toast(msg: "too short username!", context: ref.context);

      return;
    }
    if (email.isEmpty) {
      toast(msg: "Email is empty", context: ref.context);
      return;
    }
    if (password.length <= 8) {
      toast(
          msg: "Password must contain atleast 9 character.",
          context: ref.context);
      return;
    }
    if (state.password != state.rePassword || password != repassword) {
      toast(msg: "password didn't match!", context: ref.context);
      return;
    }
    ref.read(apploaderProvider.notifier).setloader(true);
    //final pop = Navigator.pop(ref.context);
    final context = ref.context;
    try {
      final credential =
          await SignUpRepo.firebaseSignUp(email: email, password: password);
      if (kDebugMode) {
        print(" credential is $credential");
      }
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);
        toast(
            msg:
                "An email has been sent to verify your account. Please open your inbox to verify.",
            context: ref.context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toast(msg: 'This password is weak', context: context);
      } else if (e.code == 'email-already-in-use') {
        toast(msg: "This email address is already in use", context: context);
      } else if (e.code == 'invalid-email') {
        toast(msg: "This email is envalid", context: context);
      } else if (e.code == 'user-not-found') {
        toast(msg: 'User not found', context: context);
      } else if (e.code == 'wrong-password') {
        toast(msg: 'Wrong password', context: context);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    ref.watch(apploaderProvider.notifier).setloader(false);
  }
}
