import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/common/widgets/button_widgets.dart';
import '../../../navigation_menu.dart';

class SoulScanResultScreen extends StatelessWidget {
  const SoulScanResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> traits = [
      {
        'title': 'The Worried',
        'desc':
        'You are feeling unsure. Take a deep breath and give yourself a moment.',
        'color': '0xFF072755',
        'image': 'assets/images/Frame 21472291.png'
      },
      {
        'title': 'The Calm',
        'desc': 'You are feeling calm. Maintain this peaceful energy.',
        'color': '0xFF072755',
        'image': 'assets/images/Frame 21472294.png'
      },
      {
        'title': 'The Peaceful',
        'desc':
        'You are feeling peaceful. Appreciate the small joys around you.',
        'color': '0xFF072755',
        'image': 'assets/images/Frame 2147229491 (2).png'
      },
      {
        'title': 'The Angry',
        'desc':
        'You are feeling angry. Pause for a few seconds before reacting.',
        'color': '0xFF072755',
        'image': 'assets/images/Frame 21472.png'
      },
      {
        'title': 'The Smart',
        'desc': 'You are feeling thoughtful. Keep learning new things.',
        'color': '0xFF072755',
        'image': 'assets/images/Frame 2147229491 (4).png'
      },
      {
        'title': 'The Heartful',
        'desc':
        'You are feeling warm-hearted. A small act of kindness can go far.',
        'color': '0xFF072755',
        'image': 'assets/images/Frame 2147229491 (5).png'
      },

      {
        'title': 'The Protector',
        'desc':
        'You are feeling protective. Set your boundaries in a healthy way.',
        'color': '0xFF072755',
        'image': 'assets/images/Frame 2147229491 (6).png'
      },

      {
        'title': 'The Curious',
        'desc':
        'You are feeling curious. Keep exploring and asking questions.',
        'color': '0xFF072755',
        'image': 'assets/images/Frame 2147229491 (7).png'
      },

      {
        'title': 'The Mindful',
        'desc':
        'You are feeling mindful. Take one quiet minute to stay present.',
        'color': '0xFF072755',
        'image': 'assets/images/Frame 2147229491 (8).png'
      },

      {
        'title': 'The Serene',
        'desc':
        'You are feeling serene. Sharing your calm can inspire others.',
        'color': '0xFF072755',
        'image': 'assets/images/Frame 2147229491 (9).png'
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
                          Color(0xFF1E3A5F),
                          Color(0xFF1E3A5F),
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
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: Color(0xFF072755),
                                width: 1
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF072755).withOpacity(0.9),
                                blurRadius: 4,
                                spreadRadius: 0,
                                offset: const Offset(0, 0.5),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              trait['image']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                trait['title']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                trait['desc']!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
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
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(onPressed: () {
                Get.to(() => const NavigationMenu(), arguments: 0);
              },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF102E74),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8)
                    )
                  ),
                  child: Text('Home Page', style: TextStyle(color: Colors.white),)),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your responses are private and secure',
              style: TextStyle(fontSize: 12, color: Color(0xFFDADADA), fontWeight: FontWeight.w400),
            ),
            //const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
