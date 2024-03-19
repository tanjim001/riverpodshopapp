import 'package:elearnapp/commonwidget/commonwidgets.dart';
import 'package:elearnapp/constant/color.dart';
import 'package:elearnapp/constant/iconstring.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.height, required this.width});

  final double height; 
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: appTextfield(
            imgpath: search, 
            obscure: false,
            context: context,
            hinttext: "Search your course...",
          )
              .box
              .margin(EdgeInsets.only(right: width * 0.03))
              .make(),
        ),
        GestureDetector(
          onTap: () {
            if (kDebugMode) {
              print("taped");
            }
            
          },
          child: const ImageIcon(
            size: 30,
            color: Vx.white,
            AssetImage(options),
          )
              .box
              .color(blue)
              .padding(EdgeInsets.all(0.025 * width))
              .customRounded(BorderRadius.circular(20))
              .make(),
        ),
      ],
    );
  }
}
