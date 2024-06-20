import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/features/activity/widget/activity_card.dart';

final tabs = [
  "All",
  "Replies",
  "Mentions",
  "Follows",
  "Likes",
];

final comments = [
  "Here's a thread you should follow if you love botany@jane_mobbin",
  "Count me in",
  "",
  "",
  "",
];

final smallAvatar = [
  Container(
    width: 30,
    height: 30,
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      color: Colors.green,
      shape: BoxShape.circle,
    ),
    child: const Icon(
      Icons.alternate_email,
      color: Colors.white,
      size: Sizes.size14,
    ),
  ),
  Container(
    width: 28,
    height: 28,
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      color: Colors.blue,
      shape: BoxShape.circle,
    ),
    child: const FaIcon(
      FontAwesomeIcons.arrowLeft,
      color: Colors.white,
      size: Sizes.size14,
    ),
  ),
  Container(
    width: 28,
    height: 28,
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      color: Colors.purple,
      shape: BoxShape.circle,
    ),
    child: const FaIcon(
      FontAwesomeIcons.solidUser,
      color: Colors.white,
      size: Sizes.size14,
    ),
  ),
  Container(
    width: 30,
    height: 30,
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      color: Colors.pink,
      shape: BoxShape.circle,
    ),
    child: const FaIcon(
      FontAwesomeIcons.solidHeart,
      color: Colors.white,
      size: Sizes.size14,
    ),
  ),
];

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size12, vertical: Sizes.size12),
      child: Scaffold(
        appBar: AppBar(
          // toolbarHeight: Sizes.size80,
          title: const Align(
            alignment: Alignment.centerLeft,
            child:
                Text("Activity", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            splashFactory: NoSplash.splashFactory,
            tabAlignment: TabAlignment.start,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size1,
            ),
            indicator: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(
                Sizes.size10,
              ),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
            // labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            tabs: [
              for (var tab in tabs)
                Tab(
                  child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: Sizes.size18),
                      child: SizedBox(
                          width: 70,
                          child: Text(
                            tab,
                            textAlign: TextAlign.center,
                          ))),
                ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(
              itemCount: tabs.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ActivityCard(
                      trailing: index == 2 ? true : false,
                      smallAvatar: smallAvatar[index % 5 > 2 ? 3 : index % 5],
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: Sizes.size80,
                      ),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            comments[index % 5],
                            style: const TextStyle(
                              fontSize: Sizes.size18,
                            ),
                          ),
                          Gaps.v12,
                          Divider(
                            height: 2,
                            thickness: 1,
                            color: Colors.grey.shade400,
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(tab,
                    style: const TextStyle(
                      fontSize: 28,
                    )),
              )
          ],
        ),

        /*   itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: const AvatarIcon(size: Sizes.size24),
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
                  trailing: TextButton(
                    onPressed: () => true,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ), // 모양
                      side: MaterialStateProperty.all(
                        BorderSide(
                            color: Colors.grey.shade500, width: 1.0), // 테두리
                      ),
                    ),
                    child: const Text(
                      "Follow",
                      style: TextStyle(
                        fontSize: Sizes.size18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: Sizes.size80,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "26.6K followers",
                        style: TextStyle(
                          fontSize: Sizes.size18,
                        ),
                      ),
                      Gaps.v12,
                      Divider(
                        height: 2,
                        thickness: 1,
                        color: Colors.grey.shade400,
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ), */
      ),
    );
  }
}
