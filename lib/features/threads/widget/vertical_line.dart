import 'package:flutter/material.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';

class VerticalLine extends StatelessWidget {
  const VerticalLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Gaps.h20,
          Container(
            width: Sizes.size2,
            color: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}
