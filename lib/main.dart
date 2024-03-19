import 'package:elearnapp/constant/routes.dart';
import 'package:elearnapp/global/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await Global.init();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

//using navkey for routing.
final GlobalKey<NavigatorState>navkey=GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: navkey,
      initialRoute: checkScreen,
      routes: route,
    );
  }
}