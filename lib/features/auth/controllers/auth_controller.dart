import 'package:get/get.dart';

class AuthController extends GetxController {
  Future<void> login(
    dynamic rememberMeController, {
    required String email,
    required String password,
  }) async {
    // Basic implementation for now
    await Future.delayed(const Duration(seconds: 1));
    print('Logging in with $email');
  }
}
