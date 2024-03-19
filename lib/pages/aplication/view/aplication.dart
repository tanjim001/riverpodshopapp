import 'package:elearnapp/pages/aplication/widget/applicationwidget.dart';
import 'package:elearnapp/pages/aplication/provider/applicationprovider.dart';
import 'package:elearnapp/pages/homepage/view/homepage.dart';
import 'package:elearnapp/pages/searchpage/view/search.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class Application extends ConsumerWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final currentindex = ref.watch(pageIndexProvider);
    return SizedBox(
        height: h,
        width: w,
        //padding: EdgeInsets.symmetric(horizontal: 0.02*w),
        child: SafeArea(
            top: false,
            child: Scaffold(
              backgroundColor: const Color.fromARGB(255, 231, 230, 230),
              body:  IndexedStack(index: currentindex,children: const [Homepage(),SearchPage()],),
              bottomNavigationBar: bottomnav(
                height: 0.075 * h,
                currentindex: currentindex,
                ref: ref,
              ),
            )));
  }
}
