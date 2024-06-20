import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/features/threads/widget/thread_avatar.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard(
      {super.key, required this.trailing, required this.smallAvatar});
  final bool trailing;
  final Container smallAvatar;

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    return ListTile(
      leading: Stack(
        clipBehavior: Clip.none,
        children: [
          const AvatarIcon(size: Sizes.size24),
          Positioned(
            bottom: -10,
            right: -10,
            child: smallAvatar,
          ),
        ],
      ),
      title: Text(faker.internet.userName(),
          style: const TextStyle(
            fontSize: Sizes.size16,
            fontWeight: FontWeight.bold,
          )),
      subtitle: Text(
        faker.internet.domainName(),
        style: TextStyle(
          fontSize: Sizes.size18,
          color: Colors.grey.shade500,
        ),
      ),
      trailing: trailing
          ? TextButton(
              onPressed: () => true,
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ), // 모양
                side: MaterialStateProperty.all(
                  BorderSide(color: Colors.grey.shade500, width: 1.0), // 테두리
                ),
              ),
              child: Text(
                "Following",
                style: TextStyle(
                  fontSize: Sizes.size18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade500,
                ),
              ),
            )
          : null,
    );
  }
}
