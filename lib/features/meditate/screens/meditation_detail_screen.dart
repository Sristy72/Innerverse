import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../controller/meditation_controller.dart';
import '../../quiz/widgets/meditaion_player_card.dart';
import 'playlist_screen.dart';

class MeditationDetailScreen extends StatelessWidget {
  final String title;
  final String image;

  const MeditationDetailScreen({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MeditationController());

    return AppScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Obx(
                () => MeditationPlayerCard(
                  title: controller.currentSong['title']!,
                  duration: 10,
                  image: controller.currentSong['image']!,
                  progress: 4.43,
                  onReplay: () => controller.previousSong(),
                  onForward: () => controller.nextSong(),
                  onPlay: () {
                    // Audio play logic
                  },
                ),
              ),

              const SizedBox(height: 30),
              // Benefits Section
              const Text(
                'Benefit',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              _buildBenefitItem('Reduces stress'),
              _buildBenefitItem('Improves sleep'),
              _buildBenefitItem('There are no wrong answers'),
              _buildBenefitItem('Emotional healing'),
              const SizedBox(height: 30),
              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: const BorderSide(color: Color(0xFF3377FF)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: const Color(
                          0xFF1E3A5F,
                        ).withOpacity(0.5),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => Get.to(() => PlaylistScreen()),
                      icon: const Icon(
                        Icons.playlist_play,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Playlist',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: const BorderSide(color: Color(0xFF3377FF)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: const Color(
                          0xFF1E3A5F,
                        ).withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBenefitItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
