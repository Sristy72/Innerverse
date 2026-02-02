import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/common/widgets/button_widgets.dart';

class SoulScanResultScreen extends StatelessWidget {
  const SoulScanResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> traits = [
      {
        'title': 'The Worried',
        'desc':
            'You are feeling unsure. Take a deep breath and give yourself a moment.',
        'color': '0xFF592DA0',
        'image': 'assets/images/Frame 21472291.png'
      },
      {
        'title': 'The Calm',
        'desc': 'You are feeling calm. Maintain this peaceful energy.',
        'color': '0xFF2D4A7C',
        'image': 'assets/images/Frame 21472294.png'
      },
      {
        'title': 'The Peaceful',
        'desc':
            'You are feeling peaceful. Appreciate the small joys around you.',
        'color': '0xFF1E3A5F',
        'image': 'assets/images/Frame 21472.png'
      },
      {
        'title': 'The Angry',
        'desc':
            'You are feeling angry. Pause for a few seconds before reacting.',
        'color': '0xFF592DA0',
        'image': 'assets/images/Frame 2147229491 (4).png'
      },
      {
        'title': 'The Smart',
        'desc': 'You are feeling thoughtful. Keep learning new things.',
        'color': '0xFF2D4A7C',
        'image': 'assets/images/Frame 2147229491 (4).png'
      },
      {
        'title': 'The Heartful',
        'desc':
            'You are feeling warm-hearted. A small act of kindness can go far.',
        'color': '0xFF1E3A5F',
        'image': 'assets/images/Frame 2147229491 (4).png'
      },
    ];

    return AppScaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Your Soul Scan is Complete',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Today’s highlights',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: traits.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final trait = traits[index];
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(int.parse(trait['color']!)).withOpacity(0.8),
                          Color(int.parse(trait['color']!)).withOpacity(0.4),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFF3377FF).withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        // Trait Icon/Image Placeholder
                        Container(
                          width: 97,
                          height: 97,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(trait['image']!)
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                trait['title']!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                trait['desc']!,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              text: 'Home page',
              onSimplePressed: () =>
                  Get.offAllNamed('/navigation_menu'), // Adjust route as needed
            ),
            const SizedBox(height: 16),
            const Text(
              'Your responses are private and secure',
              style: TextStyle(fontSize: 12, color: Colors.white54),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
