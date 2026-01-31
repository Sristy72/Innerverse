import 'package:get/get.dart';

class JournalEntryController extends GetxController {
  final emotions = [
    'Angry',
    'Lonely',
    'Confused',
    'Stress',
    'Sadness',
    'Tired',
    'Calm',
    'Happy',
  ];

  final selectedEmotions = <String>[].obs;
  final journalText = ''.obs;

  void toggleEmotion(String emotion) {
    if (selectedEmotions.contains(emotion)) {
      selectedEmotions.remove(emotion);
    } else {
      selectedEmotions.add(emotion);
    }
  }

  int get wordCount {
    if (journalText.value.trim().isEmpty) return 0;
    return journalText.value.trim().split(RegExp(r'\s+')).length;
  }

  void saveEntry() {
    // API / local storage logic here
    print('Selected emotions: $selectedEmotions');
    print('Journal text: ${journalText.value}');
  }
}
