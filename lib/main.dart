import 'dart:math';

import 'package:fb_clone/home/main_page.dart';
import 'package:fb_clone/pages/food/createAccountPage.dart';
import 'package:fb_clone/pages/food/login.dart';
import 'package:fb_clone/provider/profile_handler.dart';
// import 'package:fb_clone/provider/quantityAndPriceProvider.dart';
import 'package:fb_clone/provider/resturantProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize();
  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => quatityAndPriceProvider()),
        ChangeNotifierProvider(create: (create)=>resturantProvider()),
        ChangeNotifierProvider(create: (c)=>profileProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      showSemanticsDebugger: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home:mainPage()
    );
  }
}

