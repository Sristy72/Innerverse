import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import 'meditation_detail_screen.dart';

class MeditateScreen extends StatefulWidget {
  const MeditateScreen({super.key});

  @override
  State<MeditateScreen> createState() => _MeditateScreenState();
}

class _MeditateScreenState extends State<MeditateScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          const Center(
            child: Text(
              'Meditation',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),

          /// ✅ GridView must be wrapped with Expanded
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.95,
              children: const [
                TherapyCard(
                  title: 'Anxiety Release',
                  subtitle: 'Calms the mind and reduces stress.',
                  image: 'assets/images/image 1080.png',
                ),
                TherapyCard(
                  title: 'Grounding',
                  subtitle: 'Brings you back to the present moment.',
                  image: 'assets/images/image 1081.png',
                ),
                TherapyCard(
                  title: 'Inner Child',
                  subtitle: 'Heals emotions with self compassion.',
                  image: 'assets/images/image 1084.png',
                ),
                TherapyCard(
                  title: 'Sleep',
                  subtitle: 'Helps you relax and fall asleep.',
                  image: 'assets/images/image 1079.png',
                ),
                TherapyCard(
                  title: 'Breath work',
                  subtitle: 'Uses breathing to calm your body.',
                  image: 'assets/images/image 1082.png',
                ),
                TherapyCard(
                  title: 'Somatic Healing',
                  subtitle: 'Releases tension stored in the body.',
                  image: 'assets/images/image 1083.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TherapyCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const TherapyCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Get.to(() => MeditationDetailScreen(title: title, image: image)),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF273A59), Color(0xFF0E244C)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.25),
              blurRadius: 12,
              spreadRadius: 1,
            ),
          ],
          border: Border.all(color: Colors.blue),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 65,
                width: 65,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(image, fit: BoxFit.contain),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
