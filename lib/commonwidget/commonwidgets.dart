import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget appTextfield(
    {required imgpath,
    hinttext = '',
    required obscure,
    required context,
    TextEditingController? controller,
    void Function(String value)? func}) {
  final h = MediaQuery.of(context).size.height;
  final w = MediaQuery.of(context).size.width;
  return TextField(
    obscureText: obscure,
    controller: controller,
    onChanged: (value) => func!(value),
    keyboardType: TextInputType.multiline,
    maxLines: 1,
    decoration: InputDecoration(
      border: InputBorder.none,
      icon: Image.asset(
        imgpath,
        height: h * 0.05,
        width: w * 0.05,
      ),
      hintText: hinttext,
    ),
  )
      .box
      .rounded
      .border(color: const Color.fromARGB(255, 192, 192, 192))
      .padding(const EdgeInsets.only(
        left: 10,
      ))
      .make();
}

Widget loginappTextfield({
  required imgpath,
  hinttext = '',
  required obscure,
  required context,
  TextEditingController? controller,
}) {
  final h = MediaQuery.of(context).size.height;
  final w = MediaQuery.of(context).size.width;
  return TextField(
    obscureText: obscure,
    controller: controller,
    keyboardType: TextInputType.multiline,
    maxLines: 1,
    decoration: InputDecoration(
      border: InputBorder.none,
      icon: Image.asset(
        imgpath,
        height: h * 0.05,
        width: w * 0.05,
      ),
      hintText: hinttext,
    ),
  )
      .box
      .rounded
      .border(color: const Color.fromARGB(255, 192, 192, 192))
      .padding(const EdgeInsets.only(left: 10))
      .make();
}

Widget bottomstyle(String s) {
  return s.text.size(17).gray600.center.make();
}

Widget headlinestyle(String s) {
  return s.text.bold.size(22).make();
}

Widget img(String s) {
  return Image.asset(
    s,
    fit: BoxFit.fill,
  ).box.height(345).width(345).make();
}

Widget introbutton(
    {required String s,
    required BuildContext context,
    required void Function()? onpress,
    color = Colors.white,
    textcolor = Colors.black}) {
  return ElevatedButton(
    onPressed: onpress,
    style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 13.5),
        backgroundColor: color,
        foregroundColor: textcolor,
        minimumSize: const Size(double.infinity, 20.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))),
    child: s.text.size(15).semiBold.color(textcolor).make(),
  ).box.border().rounded.make();
}

AppBar appbar({required String s}) {
  return AppBar(
    title: s.text.size(18).gray800.center.make(),
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        height: 1,
        color: const Color.fromARGB(255, 209, 209, 209),
      ),
    ),
  );
}

Widget ntext({required String s}) {
  return s.text.medium.semiBold.gray500.make();
}
