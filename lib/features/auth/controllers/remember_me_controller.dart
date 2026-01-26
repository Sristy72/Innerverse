import 'package:get/get.dart';

class RememberMeController extends GetxController {
  var rememberMe = false.obs;

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }
}
