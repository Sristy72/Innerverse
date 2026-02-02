import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/common/widgets/button_widgets.dart';
import '../controllers/Bouncing_button_controller.dart';
import '../controllers/quiz_question_controller.dart';

class QuizQuestionScreen extends StatelessWidget {
  final String journeyType;

  const QuizQuestionScreen({super.key, required this.journeyType});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      QuizQuestionController(journeyType: journeyType),
    );

    return AppScaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),

            // Header Card
            Obx(
              () => Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [const Color(0xFF2D4A7C), const Color(0xFF1E3A5F)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFF3377FF).withOpacity(0.5),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    // Title
                    Text(
                      controller.journeyType,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Question ${controller.currentQuestion.value} to ${controller.totalQuestions}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Progress Bar
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value:
                            controller.currentQuestion.value /
                            controller.totalQuestions,
                        backgroundColor: Colors.white.withOpacity(0.2),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF3377FF),
                        ),
                        minHeight: 8,
                      ),
                    ),

                    SizedBox(height: 32),

                    Obx(
                      () => Container(
                        key: ValueKey<int>(controller.currentQuestion.value),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(0xFF1D2658),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0xFF3377FF).withOpacity(0.5),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Question Text
                            const Text(
                              'When I think about my childhood, I feel:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                height: 1.4,
                              ),
                            ),

                            const SizedBox(height: 20),

                            // Options
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.options.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 12),
                              itemBuilder: (context, index) {
                                return Obx(() {
                                  final isSelected =
                                      controller.selectedOption.value == index;

                                  return GestureDetector(
                                    onTap: () => controller.selectOption(index),
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Color(0xFF592DA0)
                                            : Color(0xFF202757),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: const Color(0xFF3377FF),
                                          width: isSelected ? 1 : 1,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Color(0xFF3377FF),
                                                width: 2,
                                              ),
                                            ),
                                            child: isSelected
                                                ? Center(
                                                    child: Container(
                                                      width: 10,
                                                      height: 10,
                                                      decoration:
                                                          const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Color(
                                                              0xFF3377FF,
                                                            ),
                                                          ),
                                                    ),
                                                  )
                                                : null,
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Text(
                                              controller.options[index]['text'],
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: isSelected
                                                    ? Colors.white
                                                    : Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Question Card with Animation
            const SizedBox(height: 24),

            // Navigation Buttons
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    if (controller.currentQuestion.value > 1) ...[
                      Expanded(
                        child: _BouncingButton(
                          child: OutlinedButton(
                            onPressed: () => controller.previousQuestion(),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: const BorderSide(color: Color(0xFF3377FF)),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                            child: const Text('Back'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                    Expanded(
                      child: _BouncingButton(
                        enabled: controller.isOptionSelected,
                        child: PrimaryButton(
                          text:
                              controller.currentQuestion.value ==
                                  controller.totalQuestions
                              ? 'Submit'
                              : 'Next',
                          onSimplePressed: controller.isOptionSelected
                              ? () =>
                                    controller.currentQuestion.value ==
                                        controller.totalQuestions
                                    ? controller.submitQuiz()
                                    : controller.nextQuestion()
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _BouncingButton extends StatelessWidget {
  final Widget child;
  final bool enabled;

  const _BouncingButton({required this.child, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BouncingButtonController());

    return Listener(
      onPointerDown: enabled ? (_) => controller.pressDown() : null,
      onPointerUp: (_) => controller.release(),
      onPointerCancel: (_) => controller.release(),
      child: Obx(
        () => AnimatedScale(
          scale: controller.isPressed.value ? 0.95 : 1.0,
          duration: const Duration(milliseconds: 100),
          child: child,
        ),
      ),
    );
  }
}
