import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/features/threads/widget/post_twit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final faker = Faker();
  final ScrollController _scrollController = ScrollController();
  bool _showTitle = true;

  void _onScroll() {
    print(_scrollController.offset);
    if (_scrollController.offset > 100 && _showTitle) {
      setState(() {
        _showTitle = false;
      });
    } else if (_scrollController.offset <= 100 && !_showTitle) {
      setState(() {
        _showTitle = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.size12),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(_showTitle ? 56.0 : 0.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: _showTitle ? 56 : 0,
            child: AppBar(
              surfaceTintColor: Colors.white,
              title: Image.asset(
                "assets/images/twitterX.png",
                scale: 6.0,
              ),
            ),
          ),
        ),
        body: ListView(
          controller: _scrollController,
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
