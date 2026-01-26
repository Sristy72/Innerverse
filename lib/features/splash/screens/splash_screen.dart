import 'package:flutter/material.dart';
import 'package:flutter_khapree/features/onboarding/screens/onboarding_screen.dart';
import 'package:get/get.dart';

import '../../../core/constants/assets_const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => OnboardingScreen(), transition: Transition.rightToLeft );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Image.asset(
              Images.background,
              fit: BoxFit.cover,
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 160,
                  child: Image.asset(
                    'assets/images/7b2185e946e2d3200045e9935f24ded45897a498.png',
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  'INNERVERSE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    shadows: const [
                      Shadow(
                        offset: Offset(0, 2), // X: 0, Y: 2
                        blurRadius: 4,        // Blur: 4
                        color: Color(0xFFB3D4FF),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
