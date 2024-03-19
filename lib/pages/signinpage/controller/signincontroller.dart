// ignore_for_file: use_build_context_synchronously

import 'package:elearnapp/constant/appconstant.dart';
import 'package:elearnapp/constant/routes.dart';
import 'package:elearnapp/entites/entities.dart';
import 'package:elearnapp/global/global.dart';
import 'package:elearnapp/apploader/apploader.dart';
import 'package:elearnapp/commonwidget/toast.dart';
import 'package:elearnapp/main.dart';
import 'package:elearnapp/pages/signinpage/provider/signin_notifier.dart';
import 'package:elearnapp/pages/signinpage/repo/signinrepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInController {
  //final WidgetRef ref;

  //SignInController({required this.ref});
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  Future<void> handleSignup(WidgetRef ref) async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;
    emailcontroller.text = email;
    passwordcontroller.text = password;
    if (kDebugMode) {
      print(email);
      print(password);
    }
    final context = ref.context;
    ref.read(apploaderProvider.notifier).setloader(true);
    try {
      final credential =
          await SignRepo.firebaseSignIn(email: email, password: password);

      if (kDebugMode) {
        print(credential);
      }

      if (credential.user == null) {
        toast(msg: "User not found", context: ref.context);
      }
      if (!credential.user!.emailVerified) {
        toast(msg: "verify your email first", context: ref.context);
      }
      var user = credential.user;
      if (user != null) {
        String? displayname = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photourl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photourl;
        loginRequestEntity.name = displayname;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;
        loginRequestEntity.email = email;
        asyncpostAlldata(loginRequestEntity);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toast(msg: 'User not found', context: context);
      } else if (e.code == 'wrong-password') {
        toast(msg: 'Wrong password', context: context);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    ref.read(apploaderProvider.notifier).setloader(false);
  }

  void asyncpostAlldata(LoginRequestEntity loginRequestEntity) {
    try {
      Global.storageServie.setString(Appconstant.STORAGE_USER_PROFILE_KEY, '');
      Global.storageServie.setString(Appconstant.STORAGE_USER_TOKEN_KEY, '');
      navkey.currentState?.pushNamedAndRemoveUntil(application, (route) => false);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
