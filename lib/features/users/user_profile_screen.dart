import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/common/widgets/avatar_icon.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/features/threads/widget/thread_avatar.dart';
import 'package:tiktok_challenge/features/users/settings.dart';
import 'package:tiktok_challenge/features/users/widgets/persistent_tab_bar.dart';
import 'package:tiktok_challenge/features/users/widgets/tweet_card.dart';
import 'package:tiktok_challenge/features/users/widgets/tweet_card_reply.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onTapBar() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SettingsScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                leading: IconButton(
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.globe),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.instagram),
                  ),
                  IconButton(
                    onPressed: _onTapBar,
                    icon: const FaIcon(FontAwesomeIcons.barsStaggered),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gaps.v20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Moon",
                                style: TextStyle(
                                  fontSize: Sizes.size28,
                                  letterSpacing: -1,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "moon_mobbin",
                                    style: TextStyle(
                                      fontSize: Sizes.size16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Gaps.h6,
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: Sizes.size10,
                                        vertical: Sizes.size6),
                                    decoration: BoxDecoration(
                                        color: Colors.pink.shade50,
                                        borderRadius: BorderRadius.circular(
                                          Sizes.size16,
                                        )),
                                    child: Text(
                                      "threads.net",
                                      style: TextStyle(
                                          fontSize: Sizes.size12,
                                          color: Colors.grey.shade600),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          const AvatarImg(
                            imgUrl:
                                "https://avatars.githubusercontent.com/u/90151845?v=4",
                            size: Sizes.size32,
                          ),
                        ],
                      ),
                      Gaps.v16,
                      const Text(
                        "Planet enthusiast!",
                        style: TextStyle(
                          fontSize: Sizes.size18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 50,
                            width: 60,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 12,
                                  child: AvatarIcon(
                                    size: Sizes.size12,
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  top: 12,
                                  child: AvatarIcon(
                                    size: Sizes.size12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gaps.h10,
                          Text(
                            "2 followers",
                            style: TextStyle(
                              fontSize: Sizes.size16,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                      Gaps.v20,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextBox(text: "Edit profile"),
                          Gaps.h10,
                          TextBox(text: "Share profile"),
                        ],
                      ),
                      Gaps.v20,
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                  delegate: PersistentTabBar(), pinned: true),
            ];
          },
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  final random = Random();
                  final numberOfImage = random.nextInt(4);
                  return Column(
                    children: [
                      Gaps.v12,
                      TweetCard(numberOfImage: numberOfImage),
                      Gaps.v12,
                      Divider(
                        height: 2,
                        thickness: 1,
                        color: Colors.grey.shade400,
                      ),
                    ],
                  );
                },
              ),
              ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  final random = Random();
                  final numberOfImage = random.nextInt(4);
                  return Column(
                    children: [
                      Gaps.v10,
                      TweetCardReply(
                        numberOfImage: numberOfImage,
                      ),
                      Gaps.v20,
                      Divider(
                        height: 2,
                        thickness: 1,
                        color: Colors.grey.shade400,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  const TextBox({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size32,
          vertical: Sizes.size8,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
            width: Sizes.size2,
          ),
          borderRadius: BorderRadius.circular(
            Sizes.size10,
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: Sizes.size16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
