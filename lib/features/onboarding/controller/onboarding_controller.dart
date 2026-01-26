import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/screens/login_screen.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  //variable
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  //✅ currentPageIndex
  //
  // This keeps track of which onboarding page you’re on.
  //
  // Rx<int> means it’s a reactive variable (observable).
  //
  // 0.obs makes an observable integer starting at 0.
  //
  // If the value changes, any UI widgets using it will automatically update.

  ///update current index when page scroll
  updatePageIndicator(index) {
    currentPageIndex.value = index;
  }

  //✅ When the user swipes to a new page, this method is called.
  //
  // It updates currentPageIndex to the new index.
  //
  // UI indicators (like dots) will update automatically because currentPageIndex is observable.

  ///jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  //✅ If the user clicks a dot on the page indicator:
  //
  // We update currentPageIndex.
  //
  // Then tell pageController to jump to that page.

  ///update current index and jump to next page
  nextPage() {
    if (currentPageIndex.value == 2) {
      Get.offAll(LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  //✅ When the user clicks "Next" button:
  //
  // If we are already on page index 2 (usually last page in 3-page onboarding):
  //
  // Nothing happens now (you could navigate to main screen here).
  //
  // Else:
  //
  // Increase currentPageIndex by 1.
  //
  // Jump to the next page.

  ///update current index and jump to previous page
  previousPage() {
    if (currentPageIndex.value == 0) {
      // Show snackbar message
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text('You are already on the first page.', style: TextStyle(color: Colors.white)),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.fixed,
          backgroundColor: Colors.grey,
        ),
      );
    } else {
      int page = currentPageIndex.value - 1;
      pageController.jumpToPage(page);
    }
  }

  ///update current index and jump to the last page
  skipPage() {
    // if (currentPageIndex.value == 2) {
    // } else {
    //   int page = currentPageIndex.value + 1;
    //   pageController.jumpToPage(page);
    // }
    //
    // //Get.to(LoginScreen());

    Get.offAll(LoginScreen());
  }
}
