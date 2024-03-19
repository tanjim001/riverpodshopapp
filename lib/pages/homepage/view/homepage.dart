import 'package:dots_indicator/dots_indicator.dart';
import 'package:elearnapp/commonwidget/commonwidgets.dart';
import 'package:elearnapp/constant/color.dart';
import 'package:elearnapp/constant/iconstring.dart';
import 'package:elearnapp/pages/homepage/provider/homeindexprovider.dart';
import 'package:elearnapp/pages/homepage/widget/homebanner.dart';
import 'package:elearnapp/pages/homepage/widget/searchbox.dart';
import 'package:elearnapp/pages/introduction/widget/dotdecorator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<Homepage> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  List items = ["All", "Popular", "Newest"];
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: ImageIcon(
              size: 0.03 * h,
              const AssetImage(menue),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: ImageIcon(
                size: 0.04 * h,
                const AssetImage(person2),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Hello".text.size(24).semiBold.gray400.make(),
                "dbestech".text.size(24).semiBold.black.make(),
                (0.01 * h).heightBox,
                CustomSearchBar(height: h, width: w),
                (0.02 * h).heightBox,
                banner(ref: ref, w: w),
                (0.01 * h).heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DotsIndicator(
                      dotsCount: 3,
                      decorator: dotdec(),
                      position: ref.watch(homeindexProvider).toDouble(),
                    ),
                  ],
                ),
                (0.01 * h).heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Choice your course".text.bold.black.size(24).make(),
                    "see all".text.gray400.make().onTap(() {
                      print("hello");
                    })
                  ],
                ),
                (0.005 * h).heightBox,
                Row(
                  children: [
                    custombox(item: items[0], hight: h, width: w),
                    (0.04 * w).widthBox,
                    custombox(item: items[1], hight: h, width: w),
                    (0.04 * w).widthBox,
                    custombox(item: items[2], hight: h, width: w)
                  ],
                ),
                (0.01*h).heightBox,
                GridView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                        itemCount: 20,
                    itemBuilder: (context, index) =>img(home).box.rounded.height(10).width(10).make()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



Widget custombox({required item, required hight, required width}) {
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: (hight * 0.01), vertical: (width * 0.002)),
    decoration:
        BoxDecoration(color: blue, borderRadius: BorderRadius.circular(8)),
    child: Text(
      item,
      style: const TextStyle(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
    ),
  );
}
