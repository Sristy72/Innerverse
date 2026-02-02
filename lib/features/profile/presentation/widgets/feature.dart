import 'package:flutter/material.dart';

class FeatureItem extends StatelessWidget {
  final String title;

  const FeatureItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            height: 16,
            width: 16,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF3EB655), // optional background
            ),
            child: const Icon(Icons.check, size: 12, color: Colors.white),
          ),

          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
