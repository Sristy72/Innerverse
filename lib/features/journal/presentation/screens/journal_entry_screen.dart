import 'package:flutter/material.dart';
import 'package:flutter_khapree/core/common/widgets/app_scaffold.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../controller/journal_entry_controller.dart';

class JournalEntryScreen extends StatelessWidget {
  JournalEntryScreen({super.key});

  final controller = Get.put(JournalEntryController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      removePadding: true,
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _emotionCard(),
                    const SizedBox(height: 32),
                    _journalSection(),
                    const SizedBox(height: 8),
                    _wordCount(),
                    const SizedBox(height: 33.5),
                    _tipsSection(),
                  ],
                ),
              ),
            ),
            _saveButton(),
          ],
        ),
      ),
    );
  }

  // HEADER
  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children:  [
          GestureDetector(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
          Spacer(),
          Text(
            'New Entry',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  // EMOTION CARD
  Widget _emotionCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0E2249).withOpacity(0.9),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF709FFF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'How are you feeling?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),

          /// 👇 NO Obx here
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.emotions.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 12,
              childAspectRatio: 103.67 / 30,
            ),
            itemBuilder: (context, index) {
              final emotion = controller.emotions[index];

              /// 👇 Obx ONLY where Rx is used
              return Obx(() {
                final isSelected = controller.selectedEmotions.contains(
                  emotion,
                );

                return GestureDetector(
                  onTap: () => controller.toggleEmotion(emotion),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF0546E3)
                          : Colors.white.withOpacity(0.52),
                      borderRadius: BorderRadius.circular(36),
                    ),
                    child: Center(
                      child: Text(
                        emotion,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              });
            },
          ),
        ],
      ),
    );
  }

  // JOURNAL INPUT
  Widget _journalSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'What emotions are you carrying today?\nDescribe them without judgment.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          height: 198,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Color(0xFF3377FF)),
          ),
          child: TextField(
            maxLines: null,
            style: const TextStyle(color: Color(0xFF8B8B8B)),
            cursorColor: Colors.white,
            onChanged: (value) => controller.journalText.value = value,
            decoration: const InputDecoration(
              hintText:
                  'Write here...',
              hintStyle: TextStyle(color: Color(0xFF8B8B8B)),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  // WORD COUNT
  Widget _wordCount() {
    return Obx(
      () => Text(
        '${controller.wordCount} words',
        style: const TextStyle(
          color: Color(0xFFFCFDFF),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  // TIPS
  Widget _tipsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Journaling Tips',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 12),
        _Tip(text: 'Write freely without editing yourself'),
        _Tip(text: 'Be honest about your feelings'),
        _Tip(text: 'There are no wrong answers'),
        _Tip(text: 'Reflect on patterns and insights'),
      ],
    );
  }

  // SAVE BUTTON
  Widget _saveButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          onPressed: controller.saveEntry,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2058E6).withOpacity(0.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/save.png', // 👈 your image path
                height: 20,
                width: 20,
                color: Colors.white, // optional (for monochrome icons)
              ),
              const SizedBox(width: 10),
              const Text(
                'Save',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// TIP WIDGET
class _Tip extends StatelessWidget {
  final String text;
  const _Tip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        '• $text',
        style: const TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
