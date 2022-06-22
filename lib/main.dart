import 'package:awara/services/themeService.dart';
import 'package:awara/utils/themeDef.dart';
import 'package:awara/viewPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Awara',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeService().theme,
      theme: ThemeClass.light,
      darkTheme: ThemeClass.dark,
      home: const ViewPage(),
    );
  }
}
