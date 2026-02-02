import 'package:flutter/material.dart';
import '../controller/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;

    // Ensure this widget is used inside a Stack
    return Positioned(
      bottom: 100,
      right: 18,
      left: 18, // optional: add padding from left for full width
      child: ElevatedButton(
        onPressed: () {
          // Add your next page logic here
          controller.nextPage();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0A4390),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Next',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }
}
