
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_task/screen/splashScreen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:search_task/services/database/db_helper.dart';


final dbHelper = DatabaseHelper();
Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await dbHelper.setDatabase();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  var token;
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}










