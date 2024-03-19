import 'package:elearnapp/constant/iconstring.dart';
import 'package:elearnapp/pages/aplication/provider/applicationprovider.dart';
import 'package:elearnapp/pages/homepage/provider/homeindexprovider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

Widget banner({required WidgetRef ref, required w}) {
  return Container(
    width: w,
    margin: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(60)),
    child: VxSwiper.builder(
      itemCount: 3,
      viewportFraction: 0.999,
      initialPage: ref.watch(pageIndexProvider),
      enableInfiniteScroll: true,
      onPageChanged: ( value) {

        ref.read(homeindexProvider.notifier).setindex(value);


        if (kDebugMode) {
          print("banner index is $value");
        }
      },
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          width: w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              image: DecorationImage(
                image: AssetImage(imgpath[index]),
                fit: BoxFit.fill,
              )),
        );
      },
    ),
  );
}



