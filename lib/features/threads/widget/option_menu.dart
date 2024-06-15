import 'package:flutter/material.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/features/threads/report_sheet.dart';

class OptionsMenu extends StatelessWidget {
  const OptionsMenu({super.key});
  void _onReportTap(BuildContext context) async {
    Navigator.of(context).pop();
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return const FractionallySizedBox(
          heightFactor: 0.8,
          child: ReportSheet(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(Sizes.size14)),
      child: Column(
        children: [
          Gaps.v16,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size24,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(Sizes.size24)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: Sizes.size20,
                      vertical: Sizes.size8,
                    ),
                    title: Text(
                      "Unfollow",
                      style: TextStyle(
                          fontSize: Sizes.size20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.black26,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: Sizes.size20,
                      vertical: Sizes.size12,
                    ),
                    title: Text(
                      "Mute",
                      style: TextStyle(
                          fontSize: Sizes.size20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: Sizes.size10,
              left: Sizes.size24,
              right: Sizes.size24,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(Sizes.size24)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: Sizes.size20,
                      vertical: Sizes.size8,
                    ),
                    title: Text(
                      "Hide",
                      style: TextStyle(
                          fontSize: Sizes.size20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.black26,
                  ),
                  ListTile(
                    onTap: () => _onReportTap(context),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size20,
                      vertical: Sizes.size8,
                    ),
                    title: const Text("Report",
                        style: TextStyle(
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
