import 'package:elearnapp/pages/aplication/view/aplication.dart';
import 'package:elearnapp/pages/checkview/view/check.dart';
import 'package:elearnapp/pages/introduction/view/intrductionscreen.dart';
import 'package:elearnapp/pages/signinpage/view/signinscreen.dart';
import 'package:elearnapp/pages/signup/view/signup.dart';

const checkScreen='/';
const homepage='home';
const introduction='/introduction';
const signinpage='/signin';
const signuppage='/signup';
const application='/application';

final route={
  checkScreen:(context)=>const CheckScreen(),
  introduction:(context)=>const Introduction(),
  signinpage:(context)=>const SignIn(),
  signuppage:(context)=>const Signup(),
  application:(contex)=>const Application(),
};
