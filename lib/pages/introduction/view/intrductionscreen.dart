import 'package:elearnapp/constant/appconstant.dart';
import 'package:elearnapp/constant/color.dart';
import 'package:elearnapp/constant/images.dart';
import 'package:elearnapp/constant/routes.dart';
import 'package:elearnapp/constant/strings.dart';
import 'package:elearnapp/global/global.dart';
import 'package:elearnapp/commonwidget/commonwidgets.dart';
import 'package:elearnapp/pages/introduction/widget/dotdecorator.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    List<PageViewModel>? pages = [
      PageViewModel(
        title: "",
        bodyWidget: Column(
          children: [
            img(reading),
            headlinestyle(ih1),
            20.heightBox,
            bottomstyle(ib1),
            60.heightBox,
          ],
        ),
      ),
      PageViewModel(
        title: "",
        bodyWidget: Column(
          children: [
            img(man),
            headlinestyle(ih2),
            20.heightBox,
            bottomstyle(ib2),
            60.heightBox,
          ],
        ),
      ),
      PageViewModel(
        title: "",
        bodyWidget: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: (w * 0.085)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              img(boy),
              headlinestyle(ih3),
              20.heightBox,
              bottomstyle(ib3),
              60.heightBox,
              introbutton(
                  s: "Get Started",
                  onpress: () {
                    Global.storageServie.setBool(Appconstant.STORAGE_DEVICE_OPEN_KEY, true);
                    Navigator.pushNamed(context, signinpage);

                  },
                  context: context,
                  color: blue,
                  textcolor: Colors.white),
            ],
          ),
        ),
      ),
    ];
    return SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(),
          body: IntroductionScreen(
            pages: pages,
            curve: Curves.slowMiddle,
            animationDuration: 400,
            showNextButton: false,
            showDoneButton: false,
            dotsDecorator: dotdec(),
          ),
        ));
  }
}
