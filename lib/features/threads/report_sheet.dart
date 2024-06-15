import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';

class ReportSheet extends StatelessWidget {
  const ReportSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Report",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              thickness: 1,
              color: Colors.grey.shade300,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.size12),
              child: Text(
                "Why are you reporting this thread?",
                style: TextStyle(
                    fontSize: Sizes.size18, fontWeight: FontWeight.bold),
              ),
            ),
            Gaps.v6,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.size12),
              child: Text(
                  "Your report is anonymous, except if uou're reporting an intellctual property infringement. If someone is in immediate danger, call the local emergency services-dont' wait"),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey.shade300,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                itemCount: 10,
                itemBuilder: (context, index) => const ListTile(
                  title: Text("I just don't like it"),
                  trailing: FaIcon(FontAwesomeIcons.chevronRight),
                ),
              ),
            ),
          ],
        ));
  }
}
