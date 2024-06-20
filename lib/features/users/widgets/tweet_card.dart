import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/common/widgets/avatar_icon.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/features/threads/widget/option_menu.dart';

class TweetCard extends StatefulWidget {
  const TweetCard({super.key, required this.numberOfImage});
  final int numberOfImage;

  @override
  State<TweetCard> createState() => _TweetCardState();
}

class _TweetCardState extends State<TweetCard> {
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
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AvatarImg(
                imgUrl: "https://avatars.githubusercontent.com/u/90151845?v=4",
                size: Sizes.size20,
              ),
              Gaps.h16,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "moon_mobbin",
                              style: TextStyle(
                                fontSize: Sizes.size14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Gaps.h4,
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
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: Sizes.size20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                      if (widget.numberOfImage == 0) Gaps.v20,
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
      ],
    );
  }
}
