import 'package:elearnapp/constant/iconstring.dart';
import 'package:flutter/material.dart';

class Thirdpartylogin extends StatelessWidget {
  const Thirdpartylogin({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0.2 * w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                google,
                width: 0.1 * w,
              )),
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                apple,
                width: 0.1 * w,
              )),
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                facebook,
                width: 0.1 * w,
              ))
        ],
      ),
    );
  }
}
