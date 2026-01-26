import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controller/onboarding_controller.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            width: 183,
            height: 235,
            image: AssetImage(image),
          ),
          //SizedBox(height: 16,),

          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white),
            textAlign: TextAlign.center,
          ),

          Text(
            subtitle,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.white),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 16,),

          SmoothPageIndicator(
            controller: controller.pageController,
            onDotClicked: controller.dotNavigationClick,
            count: 3,
            effect: const ExpandingDotsEffect(
              activeDotColor: Color(0xFF3377FF),
              dotHeight: 8,
              dotColor: Color(0xFF709FFF),
              dotWidth: 8
            ),
          ),
        ],
      ),
    );
  }
}