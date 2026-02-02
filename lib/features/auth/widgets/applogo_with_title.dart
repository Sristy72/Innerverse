import 'package:flutter/material.dart';
import 'package:flutx_core/core/theme/gap.dart';

class ApplogoWithTitle extends StatelessWidget {
  const ApplogoWithTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        //Gap(h: 100),

        SizedBox(
          height: 100,
          width: 98,
          child: Image(
            image: AssetImage(
              'assets/images/7b2185e946e2d3200045e9935f24ded45897a498.png',
            ),
            fit: BoxFit.contain,
          ),
        ),

        Gap(h: 10),

        Text(
          'INNERVERSE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
            shadows: [
              Shadow(
                offset: Offset(0, 2),
                blurRadius: 4,
                color: Color(0xFFB3D4FF),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
