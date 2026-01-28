import 'package:get/get.dart';

class QuizQuestionController extends GetxController {
  final String journeyType;

  QuizQuestionController({required this.journeyType});

  final RxInt selectedOption = RxInt(-1);
  final RxInt currentQuestion = 1.obs;
  final int totalQuestions = 40;

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

  bool get isOptionSelected => selectedOption.value != -1;
}
