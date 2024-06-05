import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/features/create_user_form_screen.dart';

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
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CreateUserFormScreen(
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
            Align(
              alignment: Alignment.centerLeft,
              child: SwitchListTile.adaptive(
                value: notifications,
                onChanged: onNotificationsChanged,
                title: Text(
                    "Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number",
                    style: Theme.of(context).textTheme.bodyLarge),
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
              Container(
                margin: const EdgeInsets.all(Sizes.size24),
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size12,
                  horizontal: Sizes.size24,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(Sizes.size24),
                  border: Border.all(
                    color: Colors.grey.shade200,
                    width: Sizes.size1,
                  ),
                ),
                child: const Text(
                  "Next",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
