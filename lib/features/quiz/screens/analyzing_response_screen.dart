import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import 'soul_scan_result_screen.dart';

class AnalyzingResponseScreen extends StatefulWidget {
  const AnalyzingResponseScreen({super.key});

  @override
  State<AnalyzingResponseScreen> createState() =>
      _AnalyzingResponseScreenState();
}

class _AnalyzingResponseScreenState extends State<AnalyzingResponseScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  int _completedLoops = 0;
  final int _totalLoops = 2; // change to 2 or 3


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700), // faster rotation
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _completedLoops++;

        if (_completedLoops >= _totalLoops) {
          _controller.stop();
          Get.off(() => const SoulScanResultScreen());
        } else {
          _controller.forward(from: 0); // start next loop
        }
      }
    });

    _controller.forward();
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // Outer glow/background circle
                Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF093570).withOpacity(0.5),
                  ),
                ),
                // Custom Circular Progress
                SizedBox(
                  width: 45,
                  height: 45,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return CustomPaint(
                        painter: _ProgressPainter(progress: _controller.value),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              'Analyzing Your Response',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Discover your unique personality type',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgressPainter extends CustomPainter {
  final double progress;

  _ProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final strokeWidth = 8.0;

    // Background track
    final trackPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, trackPaint);

    // Progress arc
    final progressPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF9333EA), Color(0xFF9333EA)],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.5708, // Start at top (-90 degrees)
      6.28319 * progress, // Sweep angle
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _ProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
