import 'package:flutter/material.dart';

import 'feature.dart';
import 'subscription_widget.dart';

class SubscriptionCard extends StatelessWidget {
  final bool isFree;
  final String title;
  final String price;
  final String period;
  final List<String> features;

  const SubscriptionCard({
    super.key,
    required this.isFree,
    required this.title,
    required this.price,
    required this.period,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 537,
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isFree
            ? Color(0xFF8DB3FF).withOpacity(0.2)
            : const Color(0xFF0052F5).withOpacity(0.2),
        // gradient: isFree
        //     ? null
        //     : const LinearGradient(
        //         begin: Alignment.topLeft,
        //         end: Alignment.bottomRight,
        //         colors: [
        //           Color(0xFF3377FF),
        //           Color(0xFF1E40AF),
        //         ],
        //       ),
        border: Border.all(
          color: isFree ? Color(0xFF8DB3FF).withOpacity(0.2) :  Color(0xFF0052F5).withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFA6A7E7).withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title Row
          Row(
            children: [
              Container(
                height: 28,
                width: 28,
                // decoration: BoxDecoration(
                //   color: isFree ? const Color(0xFF3377FF) : Colors.orange,
                //   borderRadius: BorderRadius.circular(8),
                // ),
                padding: const EdgeInsets.all(4),
                child: Image.asset(
                  isFree ? 'assets/images/star.png' : 'assets/images/crown.png',
                  fit: BoxFit.contain,
                  height: 40,
                  width: 40,
                ),
              ),

              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// Price
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                '\$ ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '/$period',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Divider(color: Color(0xFF142045), thickness: 1),

          const SizedBox(height: 24),

          /// What You Get
          const Text(
            'What You Get',
            style: TextStyle(
              color: Color(0xFF3377FF),
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 20),

          ...features.map((e) => FeatureItem(title: e)),

          const SizedBox(height: 34),

          /// Button
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: () {
                showSubscriptionSuccessDialog();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3377FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Subscribe',
                style: TextStyle(
                  color: Color(0xFFFCFDFF),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
