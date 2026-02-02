import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BouncingButtonController extends GetxController {
  final isPressed = false.obs;

  void pressDown() => isPressed.value = true;
  void release() => isPressed.value = false;
}
