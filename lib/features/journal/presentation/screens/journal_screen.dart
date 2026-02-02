import 'package:flutter/material.dart';
import 'package:flutter_khapree/core/common/widgets/app_scaffold.dart';
import 'package:get/get.dart';

import '../controller/journal_controller.dart';
import 'journal_entry_screen.dart';

class JournalScreen extends StatelessWidget {
  JournalScreen({super.key});

  final JournalController controller = Get.put(JournalController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      removePadding: true,
      // backgroundColor: const Color(0xFF020B2D),
      // bottomNavigationBar: _BottomNav(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              /// Header
              Center(
                child: Column(
                  children: const [
                    Text(
                      "Your Journal",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Reflect and track your inner journey",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// Today’s Journal Card
              _TodayJournalCard(),

              const SizedBox(height: 24),

              /// Recent Entries
              const Text(
                "Your Recent Entries",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 12),

              Obx(
                () => Column(
                  children: controller.journals
                      .map(
                        (e) => _JournalItem(
                          time: e["time"]!,
                          title: e["title"]!,
                          content: e["content"]!,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TodayJournalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 142,
      width: double.infinity,
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        // gradient: const LinearGradient(
        //   colors: [Color(0xFF97BAFF), Color(0xFF2058E6)],
        // ),
        color: Color(0xFF0E2249).withOpacity(0.9),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF709FFF)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/journal.png",
            height: 123, // adjust size so it looks balanced
            width: 110,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Today's Journal",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Tap to start writing",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 12),

                SizedBox(
                  width: 200, // fixed width prevents text from wrapping
                  height: 48, // button height
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.to(() => JournalEntryScreen());
                    },
                    icon: const Icon(Icons.add, color: Colors.white, size: 24),
                    label: const Text(
                      "New Entry",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2058E6).withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
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

class _JournalItem extends StatelessWidget {
  final String time;
  final String title;
  final String content;

  const _JournalItem({
    required this.time,
    required this.title,
    required this.content,
  });

  Color _getAccentColor(String timeStr) {
    final lower = timeStr.toLowerCase().trim();

    // Within ~1 week
    if (lower.contains('yesterday') ||
        lower.contains('today') ||
        lower.contains('day') ||
        lower.contains('hour') ||
        lower.contains('minute') ||
        lower == 'now') {
      return Color(
        0xFF66D7FF,
      ); // or Color(0xFF709FFF) to match your "See more" vibe
    }

    // Within ~1 month (but older than a week)
    if (lower.contains('week') ||
        lower.contains('month') &&
            lower.contains('ago') &&
            !lower.contains('year')) {
      return Color(0xFFCB4AF1);
    }

    // Year or older / full date from previous year(s)
    return Color(0xFFF76C5E);
  }

  @override
  Widget build(BuildContext context) {
    final accentColor = _getAccentColor(time);

    return Container(
      // height: 150,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A3A88),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF709FFF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Image + Time + Title
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white.withOpacity(0.15),
                ),
                child: Image.asset(
                  'assets/images/journalIcon.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 10),

              /// Time + Title
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      time,
                      style: TextStyle(
                        color: accentColor, // ← dynamic color
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          /// Content
          RichText(
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              children: [
                TextSpan(
                  text: content,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
                TextSpan(
                  text: " See more",
                  style: TextStyle(
                    color: accentColor, // ← same dynamic color
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
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

