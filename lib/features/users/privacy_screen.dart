import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _notifications = false;
  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(
      () {
        _notifications = newValue;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.size12),
            child: Row(
              children: [
                FaIcon(FontAwesomeIcons.chevronLeft),
                Gaps.h6,
                Text(
                  "Back",
                  style: TextStyle(fontSize: Sizes.size18, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        leadingWidth: Sizes.size96,
        title: const Text(
          "Privacy",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(Sizes.size1),
          child: Divider(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      body: Column(
        children: [
          SwitchListTile.adaptive(
            value: _notifications,
            activeColor: Colors.black,
            onChanged: _onNotificationsChanged,
            secondary: const FaIcon(
              FontAwesomeIcons.lock,
            ),
            title: const Text(
              "Private profile",
              style: TextStyle(
                fontSize: Sizes.size18,
              ),
            ),
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.instagram,
            ),
            title: const Text(
              "Mentions",
              style: TextStyle(
                fontSize: Sizes.size18,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Everyone",
                    style: TextStyle(
                      fontSize: Sizes.size18,
                      color: Colors.grey.shade500,
                    )),
                Gaps.h10,
                FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.grey.shade500,
                  size: Sizes.size20,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.bellSlash,
              size: Sizes.size20,
            ),
            title: const Text(
              "Muted",
              style: TextStyle(
                fontSize: Sizes.size18,
              ),
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.grey.shade500,
              size: Sizes.size20,
            ),
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.eyeSlash,
              size: Sizes.size20,
            ),
            title: const Text(
              "Hidden Words",
              style: TextStyle(
                fontSize: Sizes.size18,
              ),
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.grey.shade500,
              size: Sizes.size20,
            ),
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.userGroup,
              size: Sizes.size20,
            ),
            title: const Text(
              "Profiles you follow",
              style: TextStyle(
                fontSize: Sizes.size18,
              ),
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.grey.shade500,
              size: Sizes.size20,
            ),
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          ListTile(
            title: const Text(
              "Other privacy settigns",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: FaIcon(
              FontAwesomeIcons.shareFromSquare,
              color: Colors.grey.shade500,
              size: Sizes.size20,
            ),
          ),
          ListTile(
            subtitle: Text(
              "Some setting, like restricr, ap[ply to both Threads and Indtagram and can be managed on instagram",
              style: TextStyle(
                fontSize: Sizes.size18,
                color: Colors.grey.shade500,
              ),
            ),
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.circleXmark,
            ),
            title: const Text(
              "Blocked profiles",
              style: TextStyle(
                fontSize: Sizes.size18,
              ),
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.grey.shade500,
              size: Sizes.size20,
            ),
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.heartCircleMinus,
              size: Sizes.size20,
            ),
            title: const Text(
              "Hide likes",
              style: TextStyle(
                fontSize: Sizes.size18,
              ),
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.grey.shade500,
              size: Sizes.size20,
            ),
          ),
        ],
      ),
    );
  }
}
