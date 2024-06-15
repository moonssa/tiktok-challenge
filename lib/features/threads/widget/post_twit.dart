import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/features/threads/widget/option_menu.dart';
import 'package:tiktok_challenge/features/threads/widget/thread_avatar.dart';

class TwitPost extends StatefulWidget {
  const TwitPost({super.key, required this.numberOfImage});
  final int numberOfImage;

  @override
  State<TwitPost> createState() => _TwitPostState();
}

class _TwitPostState extends State<TwitPost> {
  final faker = Faker();

  List<String> generateImageUrls(int count) {
    return List.generate(
      count,
      (index) =>
          'https://picsum.photos/seed/${faker.randomGenerator.integer(1000)}/300/150', // Lorem Picsum 사용
    );
  }

  void _ellipsisTap() async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const FractionallySizedBox(
          heightFactor: 0.45,
          child: OptionsMenu(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final imageUrls = generateImageUrls(10);

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                const AvatarIcon(size: Sizes.size24),
                Positioned(
                  bottom: -10,
                  right: -10,
                  child: Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const FaIcon(
                      FontAwesomeIcons.circlePlus,
                    ),
                  ),
                ),
              ],
            ),
            Gaps.h16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            faker.internet.userName(),
                            style: const TextStyle(
                              fontSize: Sizes.size14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Gaps.h4,
                          const FaIcon(FontAwesomeIcons.circleCheck,
                              size: Sizes.size14),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("2m"),
                          Gaps.h6,
                          GestureDetector(
                            onTap: _ellipsisTap,
                            child: const FaIcon(
                              FontAwesomeIcons.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Gaps.v4,
                  Text(
                    faker.lorem.sentence(),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: Sizes.size20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 2,
                height: widget.numberOfImage == 0 ? 90 : 200,
                color: Colors.grey,
              ),
              Gaps.h10,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: Sizes.size28,
                  ),
                  child: Column(
                    children: [
                      if (widget.numberOfImage != 0)
                        SizedBox(
                            height: 180,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.numberOfImage > 10
                                  ? 10
                                  : widget.numberOfImage,
                              itemBuilder: (context, index) {
                                return Container(
                                    padding: const EdgeInsets.only(
                                      top: Sizes.size10,
                                      bottom: Sizes.size10,
                                      right: Sizes.size10,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        Sizes.size10,
                                      ),
                                      child: Image.network(
                                        imageUrls[index],
                                        fit: BoxFit.cover,
                                      ),
                                      // ),
                                    ));
                              },
                            )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size18,
                            color: Colors.grey.shade600,
                          ),
                          Gaps.h16,
                          FaIcon(
                            FontAwesomeIcons.comment,
                            size: Sizes.size18,
                            color: Colors.grey.shade600,
                          ),
                          Gaps.h16,
                          FaIcon(
                            FontAwesomeIcons.repeat,
                            size: Sizes.size18,
                            color: Colors.grey.shade600,
                          ),
                          Gaps.h16,
                          FaIcon(
                            FontAwesomeIcons.paperPlane,
                            size: Sizes.size18,
                            color: Colors.grey.shade600,
                          ),
                        ],
                      ),
                      Gaps.v12,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            const SizedBox(
              height: 60,
              width: 60,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 10,
                    child: AvatarIcon(size: Sizes.size12),
                  ),
                  Positioned(left: 28, child: AvatarIcon(size: Sizes.size14)),
                  Positioned(
                    left: 18,
                    top: 32,
                    child: AvatarIcon(size: Sizes.size10),
                  ),
                ],
              ),
            ),
            Text("53 replies ·  437 likes",
                style: TextStyle(
                  color: Colors.grey.shade600,
                ))
          ],
        ),
      ],
    );
  }
}
