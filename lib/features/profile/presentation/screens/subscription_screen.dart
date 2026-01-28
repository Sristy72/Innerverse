import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/app_scaffold.dart';
import '../widgets/subscription_card.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      removePadding: true ,
      body: 
      SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
      
              /// Header
              SizedBox(
                height: 50,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                    const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Subscription Plan',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Manage your plan and billing',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      
              const SizedBox(height: 24),
      
              /// FREE PLAN
              const SubscriptionCard(
                isFree: true,
                title: 'Free',
                price: '00.00',
                period: 'month',
                features: [
                  'Training Access',
                  'Community Chat',
                  'Trading Signals',
                  'Email Support',
                ],
              ),
      
              const SizedBox(height: 24),
      
              /// PREMIUM PLAN
              const SubscriptionCard(
                isFree: false,
                title: 'Premium',
                price: '3.99',
                period: 'year',
                features: [
                  'Faster Returns',
                  'Moderate Risk',
                  'Team Installation',
                  'Performance Tracking',
                ],
              ),
      
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
