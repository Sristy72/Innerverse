import 'package:flutter/material.dart';
import 'package:flutter_khapree/core/common/widgets/app_scaffold.dart';
import 'package:flutter_khapree/features/meditate/screens/meditate_screen.dart';
import 'package:flutter_khapree/features/profile/presentation/screens/profile_screen.dart';
import 'package:get/get.dart';
import 'core/constants/assets_const.dart';
import 'core/utils/app_svg.dart';
import 'features/home/screens/home_screens.dart';


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the initial index from arguments (defaults to 0 if not provided)
    final int initialIndex = Get.arguments ?? 0;
    final controller = Get.put(
      NavigationController(initialIndex: initialIndex),
    );

    return AppScaffold(
      removePadding: true,
      //backgroundColor: const Color(0xFFFFF1DB),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF202F4E),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.white.withOpacity(.3)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(controller.items.length, (index) {
              final item = controller.items[index];
              final isSelected = controller.selectedIndex.value == index;

              return GestureDetector(
                onTap: () => controller.selectedIndex.value = index,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 260),
                  curve: Curves.easeOut,

                  padding: EdgeInsets.all(isSelected ? 0 : 12),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF2058E6)
                        : const Color(0xFF2058E6),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: AnimatedPadding(
                    duration: const Duration(milliseconds: 260),
                    padding: EdgeInsets.symmetric(
                      horizontal: isSelected ? 20 : 0,
                      vertical: isSelected ? 12 : 0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedScale(
                          scale: isSelected ? 1 : 1.0,
                          duration: const Duration(milliseconds: 220),
                          child: AppSvg(
                            asset: item['icon'],
                            height: 22,
                            color: isSelected ? Colors.white : Colors.white,
                          ),
                        ),

                        if (isSelected) ...[
                          const SizedBox(width: 6),
                          Text(
                            item['label'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  NavigationController({int initialIndex = 0}) {
    selectedIndex.value = initialIndex;
  }

  final RxInt selectedIndex = 0.obs;

  final List<Map<String, dynamic>> items = [
    {'icon': Images.home, 'label': 'Home'},
    {'icon': Images.journal, 'label': 'Journal'},
    {'icon': Images.meditate, 'label': 'Meditate'},
    {'icon': Images.profile, 'label': 'Profile'},
  ];

  final List<Widget> screens = [
    const HomeScreen(),
    const Text('Journal', style: TextStyle(color: Colors.white),),
    MeditateScreen(),
    const ProfileScreen(),
    // const Text('profile', style: TextStyle(color: Colors.white),),
  ];
}
