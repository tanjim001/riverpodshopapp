import 'package:elearnapp/firebase_options.dart';
import 'package:elearnapp/service/storageservice.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Global {
  static late StorageServie storageServie;
  
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    storageServie = await StorageServie().init();
  }
}
