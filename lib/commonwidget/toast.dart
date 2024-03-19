import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

toast({required msg, required context}) {
  return showToast(msg,
      context: context,
      borderRadius: BorderRadius.circular(20),
      position: StyledToastPosition.top,
      backgroundColor: Colors.yellow,
      textStyle: const TextStyle(
          color: Colors.redAccent, fontSize: 15, fontWeight: FontWeight.w400),
      animation: StyledToastAnimation.fade,
      reverseAnimation: StyledToastAnimation.fade);
}
