import 'package:get/get.dart';

class JournalController extends GetxController {
  final journals = <Map<String, String>>[
    {
      "time": "Today",
      "title": "What emotions came up for you today?\nHow did you respond to them?",
      "content":
          "Today I felt a mix of stress and tiredness. I responded by taking a short break and focusing on my breathing..."
    },
    {
      "time": "2 days ago",
      "title": "Finding peace in chaos",
      "content": "Today I realized that my need for control... This is the full journal entry content that would be stored and retrieved from the backed. It contains the user's complete reflection and thoughts from ..."
    },
     {
      "time": "2 month ago",
      "title": "Letting go",
      "content": "I finally understood why I hold on so tight... This is the full journal entry content that would be stored and retrieved from the backend. It contains the user's complete reflection and thoughts..."
    },
    {
      "time": "November 27, 2025",
      "title": "Letting go",
      "content": "I finally understood why I hold on so tight... This is the full journal entry content that would be stored and retrieved from the backend. It contains the user's complete reflection and thoughts..."
    },
  ].obs; // 🔥 THIS IS THE FIX
}
