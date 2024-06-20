import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/features/users/privacy_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text("Are you sure? "),
        content: const Text("Please don't go"),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(context),
            child: const Text("No"),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.pop(context),
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  void _onTapPrivacy(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const PrivacyScreen(),
    ));
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
          "Settings",
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
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.userPlus,
            ),
            title: Text(
              "Follow and invite friends",
              style: TextStyle(
                fontSize: Sizes.size18,
              ),
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.bell,
            ),
            title: Text(
              "Notifications",
              style: TextStyle(
                fontSize: Sizes.size18,
              ),
            ),
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.lock,
            ),
            title: const Text(
              "Privacy",
              style: TextStyle(
                fontSize: Sizes.size18,
              ),
            ),
            onTap: () => _onTapPrivacy(context),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.circleUser,
            ),
            title: Text(
              "Account",
              style: TextStyle(
                fontSize: Sizes.size18,
              ),
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.fan,
            ),
            title: Text(
              "Help",
              style: TextStyle(
                fontSize: Sizes.size18,
              ),
            ),
          ),
          const ListTile(
            // leading: Container(
            //   decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       color: Colors.black,
            //       border: Border.all(
            //         color: Colors.black,
            //         width: 2,
            //       )),
            //   child: const FaIcon(
            //     FontAwesomeIcons.circleInfo,
            //     color: Colors.white,
            //   ),
            // ),
            leading: FaIcon(
              FontAwesomeIcons.circleInfo,
            ),
            title: Text(
              "About",
              style: TextStyle(
                fontSize: Sizes.size18,
              ),
            ),
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: CupertinoButton(
              child: Text(
                "Log out",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              onPressed: () => _showAlertDialog(context),
            ),
          ),
        ],
      ),
    );
  }
}
