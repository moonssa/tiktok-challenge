import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/features/timeline/widget/post_twit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final faker = Faker();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.size12),
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            "assets/images/twitterX.png",
            scale: 6.0,
          ),
        ),
        body: ListView(
          children: [
            const TwitPost(numberOfImage: 3),
            Gaps.v12,
            Divider(
              height: 2,
              thickness: 1,
              color: Colors.grey.shade400,
            ),
            Gaps.v12,
            const TwitPost(numberOfImage: 0),
            Divider(
              height: 2,
              thickness: 1,
              color: Colors.grey.shade400,
            ),
            Gaps.v12,
            const TwitPost(numberOfImage: 5),
            Divider(
              height: 2,
              thickness: 1,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}
