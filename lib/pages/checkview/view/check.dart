import 'package:elearnapp/global/global.dart';
import 'package:elearnapp/pages/aplication/view/aplication.dart';
import 'package:elearnapp/pages/introduction/view/intrductionscreen.dart';
import 'package:elearnapp/pages/signinpage/view/signinscreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CheckScreen extends StatelessWidget {
  const CheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //assigning Global.storageServie.getdevicefirstopen() to check if use first open or not.
    final isFirstOpen = Global.storageServie.getdevicefirstopen();
    final isloggedin = Global.storageServie.islogin();
    if (kDebugMode) {
      print("first open value $isFirstOpen");
      print("login value $isloggedin");
    }

    if (isloggedin == false && isFirstOpen == false) {
      return const Introduction();
    }

    if (isloggedin) {
      return const Application();
    }

    return const SignIn();
  }
}
