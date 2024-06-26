import 'package:flutter/material.dart';
import 'package:tiktok_challenge/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.text,
    required this.disable,
  });
  final String text;
  final bool disable;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size14,
          horizontal: Sizes.size14,
        ),
        // alignment: Alignment.center,
        decoration: BoxDecoration(
          color: text == "Sign Up"
              ? Theme.of(context).primaryColor
              : disable
                  ? Colors.black38
                  : Colors.black,
          borderRadius: BorderRadius.circular(Sizes.size24),
          border: Border.all(
            color: Colors.grey.shade200,
            width: Sizes.size1,
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
