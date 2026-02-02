import 'package:flutter/material.dart';
import 'package:flutter_khapree/core/common/widgets/app_scaffold.dart';
import 'package:flutter_khapree/features/journal/presentation/screens/journal_screen.dart';
import 'package:get/get.dart';

import '../../../navigation_menu.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      removePadding: true,
      // backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            const SizedBox(height: 20),
            _statsRow(),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 16),
                child: _recommendationsContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Header
  Widget _header() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage("assets/images/avatar2.png"),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Text(
                controller.userName.value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Text(
              "Welcome back",
              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ],
        ),
        const Spacer(),
        Stack(
          children: [
            const Icon(Icons.notifications_none, color: Colors.white, size: 26),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 16,
                height: 16,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    "3",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 🔹 Stats Row
  Widget _statsRow() {
    return Row(
      children: [
        // 🔥 STREAK
        _statCard(
          gradientColors: const [
            Color(0xFF122652), // purple top
            Color(0xFF202258), // purple bottom
          ],
          iconBgColor: const Color(0xFF9333EA).withOpacity(0.4),
          image: "assets/images/streak.png",
          value: controller.dayStreak,
          label: "Day Streak",
        ),

        const SizedBox(width: 12),

        // 🌿 MEDITATION
        _statCard(
          gradientColors: const [
            Color(0xFF0D4535), // green top
            Color(0xFF0A2947), // green bottom
          ],
          iconBgColor: const Color(0xFF80FF00).withOpacity(0.2),
          image: "assets/images/meditation.png",
          value: controller.meditations,
          label: "Meditations",
        ),

        const SizedBox(width: 12),

        // 📘 JOURNAL
        _statCard(
          gradientColors: const [
            Color(0xFF262F4B), // red top
            Color(0xFF2E182A), // red bottom
          ],
          iconBgColor: const Color(0xFFFF1700).withOpacity(0.4),
          image: "assets/images/journalHome.png",
          value: controller.journalEntries,
          label: "Journal Entries",
        ),
      ],
    );
  }

  Widget _statCard({
    required List<Color> gradientColors, // 👈 gradient colors
    required Color iconBgColor,
    required String image,
    required RxInt value,
    required String label,
  }) {
    return Expanded(
      child: Container(
        height: 120,
        width: 109,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFF3377FF)),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(6),
              child: Image.asset(
                image,
                // fit: BoxFit.contain,
                height: 20,
                width: 20,
              ),
            ),
            const SizedBox(height: 8),
            Obx(
              () => Text(
                value.value.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }


  // 🔹 Recommendations
  Widget _recommendationsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Today's Recommendations",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        _recommendationTile(
          title: "Morning Meditation",
          subtitle: "Start your day with inner peace",
        ),
        _recommendationTile(
          title: "Journal Prompt",
          subtitle: "Reflect on your patterns",
        ),
        _recommendationTile(
          title: "Daily Mission",
          subtitle: "Practice self-compassion",
        ),
        const SizedBox(height: 16),
        _missionCard(),
      ],
    );
  }

  Widget _recommendationTile({
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.only(left: 8, top: 16, right: 8, bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A3A88),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFF3377FF)),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        mainAxisSize: MainAxisSize.max, // 👈 important
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(
              color: Color(0xFFFCFDFF),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Daily Mission Card
  Widget _missionCard() {
    return Container(
      height: 145,
      // width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF223457), Color(0xFF0F254D)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF3377FF)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // <-- added
        children: [
          Container(
            height: 123,
            width: 122,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25), // shadow color
                  spreadRadius: 0, // how much the shadow spreads
                  blurRadius: 4, // blur effect
                  offset: const Offset(0, 0.5), // x, y offset
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/daily.png',
              height: 123,
              width: 122,
              fit: BoxFit.contain,
            ),
          ),

          // Image.asset(
          //   'assets/images/daily.png',
          //   height: 123,
          //   width: 122,
          //   fit: BoxFit.contain,

          // ),
          const SizedBox(width: 16),

          /// 📝 TEXT + BUTTON COLUMN
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // text top, button bottom
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Daily Mission",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Write about a moment today\nwhen you felt truly seen.",
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),

                /// 🔘 BUTTON AT THE BOTTOM
                SizedBox(
                  height: 48,
                  width: 189,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2058E6).withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      alignment: Alignment.center,
                      elevation: 6, // <-- shadow depth
                      shadowColor: Colors.black.withOpacity(0.1),
                    ),
                    onPressed: () {
                      Get.to(() => const NavigationMenu(), arguments: 1);
                    },
                    child: const Text(
                      "Start Mission",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
