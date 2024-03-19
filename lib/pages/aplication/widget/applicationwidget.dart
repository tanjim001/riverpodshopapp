import 'package:elearnapp/pages/aplication/widget/bottomicons.dart';
import 'package:elearnapp/constant/color.dart';
import 'package:elearnapp/pages/aplication/provider/applicationprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget bottomnav({required height, required currentindex,required WidgetRef ref}) {
  return Container(
    height: height,
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 240, 240, 240),
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(15), topLeft: Radius.circular(15)),
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(66, 39, 39, 39),
          blurRadius: 3,
          offset: Offset(1, 1),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        navigationIcons.length,
        (index) => IconButton(
          icon: navigationIcons[index],
          color: currentindex == index ? blue : bottomgrey,
          iconSize: currentindex == index ? 30 : 25,
          autofocus: true,
          onPressed: () {
            ref.read(pageIndexProvider.notifier).setindex(index);
          },
        ),
      ),
    ),
  );
}
