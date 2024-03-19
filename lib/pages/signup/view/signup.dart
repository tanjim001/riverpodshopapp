import 'package:elearnapp/apploader/apploader.dart';
import 'package:elearnapp/pages/signup/controller/sign_up_controller.dart';
import 'package:elearnapp/pages/signup/provider/register_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elearnapp/constant/color.dart';
import 'package:elearnapp/constant/iconstring.dart';
import 'package:elearnapp/constant/strings.dart';
import 'package:elearnapp/commonwidget/commonwidgets.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Signup extends ConsumerStatefulWidget {
  const Signup({super.key});

  @override
  ConsumerState<Signup> createState() => _SignupState();
}

class _SignupState extends ConsumerState<Signup> {
  late SignUpController _controller;

  @override
  void didChangeDependencies() {
    _controller = SignUpController();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final regprovider = ref.watch(registerNotifierProvider);
    final loader = ref.watch(apploaderProvider);
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: appbar(s: signUp),
        body: (loader == false)
            ? Container(
                margin: EdgeInsets.symmetric(horizontal: (w * 0.06)),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (h * 0.02).heightBox,
                      signupH.text.size(15).gray500.makeCentered(),
                      (h * 0.06).heightBox,
                      ntext(s: username),
                      (h * 0.007).heightBox,
                      appTextfield(
                          imgpath: person1,
                          func: (value) => ref
                              .read(registerNotifierProvider.notifier)
                              .onusernameupdate(value),
                          obscure: false,
                          hinttext: username,
                          context: context),
                      (h * 0.03).heightBox,
                      ntext(s: email),
                      (h * 0.007).heightBox,
                      appTextfield(
                          imgpath: person1,
                          func: (value) => ref
                              .read(registerNotifierProvider.notifier)
                              .onuseremailupdate(value),
                          obscure: false,
                          hinttext: entemail,
                          context: context),
                      (h * 0.03).heightBox,
                      ntext(s: password),
                      (h * 0.007).heightBox,
                      appTextfield(
                          imgpath: lock,
                          func: (value) => ref
                              .read(registerNotifierProvider.notifier)
                              .onpasswordupdate(value),
                          obscure: true,
                          hinttext: entpass,
                          context: context),
                      (h * 0.03).heightBox,
                      ntext(s: conpass),
                      (h * 0.007).heightBox,
                      appTextfield(
                          imgpath: lock,
                          func: (value) => ref
                              .read(registerNotifierProvider.notifier)
                              .onrepasswordupdate(value),
                          obscure: true,
                          hinttext: entconpass,
                          context: context),
                      (h * 0.023).heightBox,
                      ntext(s: conditions),
                      (h * 0.085).heightBox,
                      introbutton(
                          s: signUp,
                          context: context,
                          onpress: () => _controller.handleSignup(ref),
                          color: blue,
                          textcolor: Colors.white),
                    ],
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                color: blue,
                backgroundColor: Colors.white,
              )),
      ),
    );
  }
}
