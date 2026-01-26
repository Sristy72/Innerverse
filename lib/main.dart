import 'package:flutter/material.dart';
import 'package:flutter_khapree/features/splash/screens/splash_screen.dart';
import 'package:get/get.dart';

import 'core/init/app_initializer.dart';
import 'core/theme/app_theme.dart';

void main() async {
  await AppInitializer.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.light,
      home: SplashScreen()
    );
  }
}
