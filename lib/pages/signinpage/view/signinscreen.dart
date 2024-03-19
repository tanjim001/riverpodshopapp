import 'package:elearnapp/apploader/apploader.dart';
import 'package:elearnapp/pages/signinpage/provider/signin_notifier.dart';
import 'package:elearnapp/pages/signinpage/controller/signincontroller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elearnapp/constant/color.dart';
import 'package:elearnapp/constant/iconstring.dart';
import 'package:elearnapp/constant/routes.dart';
import 'package:elearnapp/commonwidget/commonwidgets.dart';
import 'package:elearnapp/pages/signinpage/widget/signinwidget.dart';
import 'package:elearnapp/pages/signinpage/widget/thirdpartylogin.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late SignInController _controller;

  @override
  void didChangeDependencies() {
    _controller = SignInController();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
   // final signinprovider = ref.watch(signInNotifierProvider);
   // final loader = ref.watch(apploaderProvider);

    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: appbar(s: 'Log In'),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: (w * 0.06)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (h * 0.04).heightBox,
                const Thirdpartylogin(),
                (h * 0.01).heightBox,
                "Or use your Email account to login"
                    .text
                    .size(14)
                    .gray400
                    .makeCentered(),
                (h * 0.06).heightBox,
                "Email".text.medium.semiBold.gray500.make(),
                (h * 0.007).heightBox,
                appTextfield(
                    imgpath: person1,
                    //controller: _controller.emailcontroller,
                    func: (value) => ref
                        .watch(signInNotifierProvider.notifier)
                        .onuseremailupdate(value),
                    obscure: false,
                    hinttext: "Enter your e-mail",
                    context: context),
                (h * 0.03).heightBox,
                "Password".text.medium.semiBold.gray500.make(),
                (h * 0.007).heightBox,
                appTextfield(
                    imgpath: lock,
                    // controller: _controller.passwordcontroller,
                    func: (value) => ref
                        .watch(signInNotifierProvider.notifier)
                        .onpasswordupdate(value),
                    obscure: true,
                    hinttext: "Enter your Password",
                    context: context),
                forgotbutton(onpress: () {}, context: context),
                (h * 0.17).heightBox,
                introbutton(
                    s: "Log In",
                    context: context,
                    onpress: () => _controller.handleSignup(ref),
                    color: blue,
                    textcolor: Colors.white),
                (h * 0.025).heightBox,
                introbutton(
                  s: "Sign Up",
                  context: context,
                  onpress: () {
                    Navigator.of(context).pushNamed(signuppage);
                  },
                  color: Vx.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
