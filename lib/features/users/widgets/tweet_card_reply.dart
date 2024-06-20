import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/common/widgets/avatar_icon.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/features/threads/widget/thread_avatar.dart';
import 'package:tiktok_challenge/features/threads/widget/vertical_line.dart';

final faker = Faker();
List<String> generateImageUrls(int count) {
  return List.generate(
    count,
    (index) =>
        'https://picsum.photos/seed/${faker.randomGenerator.integer(1000)}/300/150', // Lorem Picsum 사용
  );
}

class TweetCardReply extends StatelessWidget {
  const TweetCardReply({super.key, required this.numberOfImage});
  final int numberOfImage;

  @override
  Widget build(BuildContext context) {
    final imageUrls = generateImageUrls(10);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size10,
      ),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AvatarIcon(size: Sizes.size24),
                    Gaps.v10,
                    Gaps.h10,
                    VerticalLine(),
                    Gaps.v10,
                    AvatarImg(
                      imgUrl:
                          "https://avatars.githubusercontent.com/u/90151845?v=4",
                      size: Sizes.size24,
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
                            ],
                          ),
                        ],
                      ),
                      Text(
                        faker.lorem.sentence(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: Sizes.size16,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Gaps.h10,
                          Expanded(
                            child: Column(
                              children: [
                                if (numberOfImage != 0)
                                  SizedBox(
                                      height: 180,
                                      width: double.infinity,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: numberOfImage > 10
                                            ? 10
                                            : numberOfImage,
                                        itemBuilder: (context, index) {
                                          return Container(
                                              padding: const EdgeInsets.only(
                                                top: Sizes.size10,
                                                bottom: Sizes.size10,
                                                right: Sizes.size10,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
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
                                if (numberOfImage == 0) Gaps.v20,
                                const ReactionBar(),
                                Gaps.v48,
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "moon_mobbin",
                            style: TextStyle(
                              fontSize: Sizes.size14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            faker.lorem.sentence(),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: Sizes.size16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Gaps.v20,
          const Padding(
            padding: EdgeInsets.only(
              left: Sizes.size72 + Sizes.size4,
            ),
            child: ReactionBar(),
          ),
        ],
      ),
    );
  }
}

class ReactionBar extends StatelessWidget {
  const ReactionBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
