import 'package:flutter/material.dart';
import 'package:flutter_khapree/features/profile/presentation/screens/edit_profile_screen.dart';

import 'package:get/get.dart';

import '../../../../core/common/widgets/app_scaffold.dart';
import 'change_password_screen.dart';
import 'faq_screen.dart';
import 'privacy_policy_screen.dart';
import 'subscription_screen.dart';
import 'terms_condition_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // final ProfileController profileController = Get.find<ProfileController>();
  // Or if not already put in Get: Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    // Fetch profile data when screen loads
    // profileController.fetchProfile();
    // profileController.fetchLeaderboard();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      removePadding: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),

              /// ================= PROFILE + HIGHLIGHT CARD =================
              Padding(
                padding: const EdgeInsets.all(1),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF042F4D).withOpacity(0.3),

                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFF00A3FF),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      /// -------- Profile Row --------
                      Row(
                        children: const [
                          CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage(
                              'assets/images/avatar2.png',
                            ),
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Madina Araa',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Welcome back',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      /// -------- Today Highlight --------
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF9333EA), Color(0xFF709FFF)],
                          ),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(0xFF00A3FF),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min, // 👈 important
                          children: [
                            Center(
                              child: Text(
                                "Today's highlights",
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),

                            const SizedBox(height: 10),

                            Row(
                              children: [
                                Container(
                                  height: 98,
                                  width: 97,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF38008E),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.asset(
                                    'assets/images/sadIcon.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),

                                const SizedBox(width: 12),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'The Worried',
                                        style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'You are feeling unsure. Take a deep breath and give yourself a moment.',
                                        style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// ================= SETTINGS TITLE =================
              Row(
                children: [
                  Icon(Icons.settings_outlined, color: Colors.white70),
                  SizedBox(width: 12),
                  Text(
                    'Setting',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              /// ================= SETTINGS LIST =================
              /// ================= SETTINGS LIST =================
              Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF00A3FF66).withOpacity(0.4),
                      Color(0xFF95E545).withOpacity(0.3),
                    ],
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF02345B), Color(0xFF033255)],
                    ),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(8),
                    children: [
                      _buildSettingsTile(
                        'assets/images/edit.png',
                        'Edit Profile',
                        () => Get.to(() => const EditProfileScreen()),
                        'Update your personal information',
                      ),
                      _buildSettingsTile(
                        'assets/images/password.png',
                        'Change Password',
                        () => Get.to(() => const ChangePasswordScreen()),
                        'Update your password',
                      ),
                      _buildSettingsTile(
                        'assets/images/subscription.png',
                        'Subscription',
                        () => Get.to(() => SubscriptionScreen()),
                        'Manage your plan and billing',
                      ),
                      _buildSettingsTile(
                        'assets/images/privacy.png',
                        'Privacy policy',
                        () => Get.to(() => const PrivacyPolicyScreen()),
                        'How we handle your data',
                      ),
                      _buildSettingsTile(
                        'assets/images/terms.png',
                        'Terms of Service',
                        () => Get.to(() => const TermsConditionsScreen()),
                        'App usage terms and conditions',
                      ),
                      _buildSettingsTile(
                        'assets/images/faq.png',
                        'FAQ',
                        () => Get.to(() => const FaqScreen()),
                        'Get the information you need',
                      ),
                      _buildSettingsTile(
                        'assets/images/logout.png',
                        'Log out',
                        () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsTile(
    String image,
    String title,
    VoidCallback onTap, [
    String? subtitle,
  ]) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 327,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11.5),
        decoration: BoxDecoration(
          color: const Color(0xFF001D3D),

          borderRadius: BorderRadius.circular(8),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.2),
          //     blurRadius: 4,
          //     offset: const Offset(0, 2),
          //   ),
          // ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 18, width: 18, child: Image.asset(image)),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min, // 👈 important
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFFFCFDFF),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            // const Icon(
            //   Icons.arrow_forward_ios,
            //   size: 14,
            //   color: Colors.white54,
            // ),
          ],
        ),
      ),
    );
  }
}
