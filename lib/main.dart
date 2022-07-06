import 'package:api/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/article_controller.dart';

void main() {
  Get.put(ArticleController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
