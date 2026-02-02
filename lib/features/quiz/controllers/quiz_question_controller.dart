import 'package:get/get.dart';
import '../screens/analyzing_response_screen.dart';

class QuizQuestionController extends GetxController {
  final String journeyType;

  QuizQuestionController({required this.journeyType});

  final RxInt selectedOption = RxInt(-1);
  final RxInt currentQuestion = 1.obs;
  final int totalQuestions = 10;

  final List<Map<String, dynamic>> options = [
    {'text': 'Nostalgic and warm', 'value': 0},
    {'text': 'Disconnected or uncertain', 'value': 1},
    {'text': 'Some unresolved pain or sadness', 'value': 2},
    {'text': 'Grateful for the lessons learned', 'value': 3},
  ];

  void selectOption(int index) {
    selectedOption.value = index;
  }

  void nextQuestion() {
    if (currentQuestion.value < totalQuestions) {
      currentQuestion.value++;
      selectedOption.value = -1; // Reset selection for next question
    }
  }

  void previousQuestion() {
    if (currentQuestion.value > 1) {
      currentQuestion.value--;
      // Optionally reset or keep the selection. Usually, it's better to keep it if we store answers.
      // For now, let's keep it simple as the requirements don't specify state persistence.
      selectedOption.value = -1;
    }
  }

  void submitQuiz() {
    // Navigate to the loading screen which handles the 2-second delay
    Get.to(() => const AnalyzingResponseScreen());
  }

  bool get isOptionSelected => selectedOption.value != -1;
}
