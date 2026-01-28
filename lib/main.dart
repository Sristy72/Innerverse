import 'package:flutter/material.dart';
import 'package:flutter_khapree/features/splash/screens/splash_screen.dart';
import 'package:get/get.dart';

import 'core/init/app_initializer.dart';
import 'core/theme/app_theme.dart';
import 'features/profile/presentation/screens/change_password_screen.dart';
import 'features/profile/presentation/screens/edit_profile_screen.dart';
import 'features/profile/presentation/screens/faq_screen.dart';
import 'features/profile/presentation/screens/privacy_policy_screen.dart';
import 'features/profile/presentation/screens/profile_screen.dart';
import 'features/profile/presentation/screens/subscription_screen.dart';
import 'features/profile/presentation/screens/terms_condition_screen.dart';

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
      home: ProfileScreen(),
    );
  }
}
