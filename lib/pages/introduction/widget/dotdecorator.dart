import 'package:elearnapp/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

DotsDecorator dotdec() {
  return DotsDecorator(
    size: const Size.square(10),
    activeColor: blue,
    activeSize: const Size(20, 10),
    color: Colors.black26,
    spacing: const EdgeInsets.symmetric(horizontal: 2),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
  );
}
