import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';



Widget forgotbutton({required onpress, required context}) {
  return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0),
      ),
      child: "Forget Password".text.black.underline.make());
}
