import 'package:awara/services/themeService.dart';
import 'package:awara/utils/themeDef.dart';
import 'package:awara/viewPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _firebaseApp =  Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Awara',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeService().theme,
      theme: ThemeClass.light,
      darkTheme: ThemeClass.dark,
      home: FutureBuilder(
        future: _firebaseApp,
        builder: (context, snapshot){
          if(snapshot.hasError){
            print("Future builder error MyApp()! : ${snapshot.error.toString()}");
            return const Text("something went wrong");
          }
          else if(snapshot.hasData){
            return const ViewPage();
          }
          else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
