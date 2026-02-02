import 'package:flutter/material.dart';
import 'package:flutter_khapree/core/common/widgets/app_scaffold.dart';
import 'package:flutx_core/core/theme/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../core/common/widgets/button_widgets.dart';
import '../../../navigation_menu.dart';
import '../widgets/applogo_with_title.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Align(
        alignment: Alignment.center,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600, minWidth: 300),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Gap(h: 100),
                    ApplogoWithTitle(),

                    SizedBox(height: 32),

                    Text(
                      'WELCOME TO YOUR INNER JOURNEY',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Color(0xFF3377FF),
                      ),
                    ),

                    Image.asset(
                      'assets/images/Frame 2147229491 (1).png',
                      height: 147,
                      width: 155,
                    ),

                    SizedBox(height: 93),

                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF3377FF)),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Being Quiz',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    Gap.h12,

                    SizedBox(height: 8),

                    PrimaryButton(
                      text: "Meditate",
                      onSimplePressed: () {
                        // Navigate to NavigationMenu and select Meditate tab (index 2)
                        Get.to(() => const NavigationMenu(), arguments: 2);
                      },
                    ),

                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
