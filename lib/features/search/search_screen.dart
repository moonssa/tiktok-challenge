import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/features/threads/widget/thread_avatar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size12, vertical: Sizes.size12),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: Sizes.size80,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Search",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
              Gaps.v10,
              CupertinoSearchTextField(),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
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
      ),
    );
  }
}
