import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/features/terms_agreement_screen.dart';
import 'package:tiktok_challenge/widgets/next_button.dart';

class CustomizeExperienceScreen extends StatefulWidget {
  const CustomizeExperienceScreen({
    super.key,
    required this.formData,
  });

  final Map<String, String> formData;

  @override
  State<CustomizeExperienceScreen> createState() =>
      _CustomizeExperienceScreenState();
}

class _CustomizeExperienceScreenState extends State<CustomizeExperienceScreen> {
  bool notifications = false;

  void onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      notifications = newValue;
    });
  }

  void _onTap() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => TermsAgreementScreen(
        initialFormData: widget.formData,
        isReturning: true,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FaIcon(
          FontAwesomeIcons.twitter,
          color: Theme.of(context).primaryColor,
          size: Sizes.size32,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size40,
          vertical: Sizes.size20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Customize your experience",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Gaps.v24,
            Text(
              "Track where you see Twitter content across the web",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Gaps.v24,
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Switch.adaptive(
                  value: notifications,
                  onChanged: onNotificationsChanged,
                ),
              ],
            ),
            Gaps.v24,
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black54,
                ),
                children: [
                  const TextSpan(text: "By signing up, you agree to our "),
                  TextSpan(
                    text: "Terms",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const TextSpan(text: ", "),
                  TextSpan(
                    text: " Privacy Policy",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const TextSpan(text: ", and"),
                  TextSpan(
                    text: " Cookie Use",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const TextSpan(text: "."),
                  const TextSpan(
                    text:
                        "Twitter may use your contact information, including your email adress and phone number for purpose outlined in our Privacy Policy.",
                  ),
                  TextSpan(
                    text: " Learn more",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: GestureDetector(
          onTap: _onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              NextButton(disable: !notifications),
            ],
          ),
        ),
      ),
    );
  }
}
