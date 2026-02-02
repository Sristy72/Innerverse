import 'package:get/get.dart';

class StartYourJourneyController extends GetxController {
  final Rx<String?> selectedJourney = Rx<String?>(null);

  void selectJourney(String journey) {
    selectedJourney.value = journey;
  }

  bool get isJourneySelected => selectedJourney.value != null;
}
