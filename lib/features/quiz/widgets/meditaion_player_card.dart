import 'package:flutter/material.dart';

class MeditationPlayerCard extends StatelessWidget {
  final String title;
  final int duration;
  final String image;
  final double progress; // 0.0 - 1.0
  final VoidCallback? onPlay;
  final VoidCallback? onReplay;
  final VoidCallback? onForward;

  const MeditationPlayerCard({
    super.key,
    required this.title,
    required this.duration,
    required this.image,
    required this.progress,
    this.onPlay,
    this.onReplay,
    this.onForward,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        //color: const Color(0xFF0F254D).withOpacity(0.8),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.blue),
      ),
      child: Column(
        children: [
          // Title & Duration
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Text(
            '${duration.toString()} min',
            style: const TextStyle(fontSize: 14, color: Colors.white70),
          ),
          const SizedBox(height: 30),

          // Meditating Figure + Controls Overlay
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                image.isEmpty
                    ? 'assets/images/image 1080.png'
                    : image, // Fallback for testing
                height: 180,
                fit: BoxFit.contain,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: onReplay,
                    icon: const Icon(
                      Icons.replay_10,
                      color: Colors.white70,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: onPlay,
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: onForward,
                    icon: const Icon(
                      Icons.forward_10,
                      color: Colors.white70,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Progress Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${(progress).toStringAsFixed(2)} / $duration', // dynamic time
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
              Row(
                children: const [
                  Icon(Icons.volume_up, color: Colors.white, size: 20),
                  SizedBox(width: 10),
                  Icon(Icons.fullscreen, color: Colors.white, size: 20),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Progress Bar
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value:
                  progress / 10, // Assuming 10 is max for now or use duration
              backgroundColor: Colors.white24,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF3377FF),
              ),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}
