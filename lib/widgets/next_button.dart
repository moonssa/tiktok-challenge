import 'package:flutter/material.dart';
import 'package:tiktok_challenge/constants/sizes.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.disable,
  });
  final bool disable;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      margin: const EdgeInsets.all(Sizes.size24),
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size12,
        horizontal: Sizes.size24,
      ),
      decoration: BoxDecoration(
        color: disable ? Colors.grey.shade300 : Colors.black,
        borderRadius: BorderRadius.circular(Sizes.size24),
        border: Border.all(
          color: Colors.grey.shade200,
          width: Sizes.size1,
        ),
      ),
      child: Text(
        "Next",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: Sizes.size16,
          fontWeight: FontWeight.w600,
          color: disable ? Colors.black38 : Colors.white,
        ),
      ),
    );
  }
}
