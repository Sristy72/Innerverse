import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/common/widgets/button_widgets.dart';
import '../controllers/start_your_journey_controller.dart';
import 'quiz_question_screen.dart';

class StartYourJourney extends StatelessWidget {
  const StartYourJourney({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StartYourJourneyController());
    return AppScaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),

            // Header
            const Text(
              'Welcome to Your Healing Journey',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 40),

            // Feature Cards
            Expanded(
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () => controller.selectJourney('Self-Awareness'),
                    child: Obx(
                      () => _buildFeatureCard(
                        image: 'assets/images/Group.png',
                        title: 'Self-Awareness',
                        subtitle: 'Understand your personality and patterns',
                        gradientColors: [
                          Color(0xFF9333EA).withOpacity(.15),
                          Color(0xFF082856).withOpacity(.8),
                        ],
                        backColor: Color(0xFF264074),
                        isSelected:
                            controller.selectedJourney.value ==
                            'Self-Awareness',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16), // Added spacing between cards
                  GestureDetector(
                    onTap: () => controller.selectJourney('Healing'),
                    child: Obx(
                      () => _buildFeatureCard(
                        image: 'assets/images/Group (1).png',
                        title: 'Healing',
                        subtitle: 'Release trauma and emotional blocks',
                        gradientColors: [
                          Color(0xFF9333EA).withOpacity(.15),
                          Color(0xFF082856).withOpacity(.8),
                        ],
                        backColor: Color(0xFF3A3D7E),
                        isSelected:
                            controller.selectedJourney.value == 'Healing',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16), // Added spacing between cards
                  GestureDetector(
                    onTap: () => controller.selectJourney('Personalized'),
                    child: Obx(
                      () => _buildFeatureCard(
                        image:
                            'assets/images/Group (2).png', // Assuming a third image
                        title: 'Personalized',
                        subtitle: 'Custom meditations just for you',
                        gradientColors: [
                          Color(0xFF9333EA).withOpacity(.15),
                          Color(0xFF082856).withOpacity(.8),
                        ],
                        backColor: Color(0xFF363B7C),
                        isSelected:
                            controller.selectedJourney.value == 'Personalized',
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),

            // Start Button
            Obx(
              () => PrimaryButton(
                text: 'Start Your Journey',
                onSimplePressed: controller.isJourneySelected
                    ? () {
                        Get.to(
                          () => QuizQuestionScreen(
                            journeyType: controller.selectedJourney.value!,
                          ),
                        );
                      }
                    : null,
              ),
            ),

            const SizedBox(height: 12),

            // Privacy Text
            const Text(
              'Your responses are private and secure',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required String image,
    required String title,
    required String subtitle,
    required List<Color> gradientColors,
    required Color backColor,
    required bool isSelected,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isSelected
              ? [
                  gradientColors[0].withOpacity(0.35),
                  gradientColors[1].withOpacity(0.95),
                ]
              : gradientColors,
          begin: Alignment.bottomCenter,
          end: Alignment.center,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected
              ? const Color(0xFF3377FF)
              : const Color(0xFF3377FF).withOpacity(0.9),
          width: isSelected ? 2.5 : 1.5,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: const Color(0xFF3377FF).withOpacity(0.4),
                  blurRadius: 12,
                  spreadRadius: 2,
                ),
              ]
            : null,
      ),
      child: Column(
        children: [
          // Icon
          Container(
            decoration: BoxDecoration(
              color: backColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x40000000), // black with 25% opacity
                  offset: Offset(0, 0.5),
                  blurRadius: 4,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(width: 32, height: 32, child: Image.asset(image)),
            ),
          ),

          const SizedBox(height: 16),

          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 8),

          // Subtitle
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
