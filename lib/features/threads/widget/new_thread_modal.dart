import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/features/threads/widget/thread_avatar.dart';
import 'package:tiktok_challenge/features/threads/widget/vertical_line.dart';

class NewThreadModal extends StatelessWidget {
  const NewThreadModal({super.key});

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel",
              style: TextStyle(color: Colors.black, fontSize: Sizes.size18)),
        ),
        leadingWidth: Sizes.size96,
        title: const Text("New Thread",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Divider(
            thickness: 1,
            color: Colors.grey.shade300,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
                vertical: Sizes.size10,
              ),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Column(
                      children: [
                        AvatarIcon(size: Sizes.size24),
                        Gaps.v10,
                        VerticalLine(),
                        Gaps.v10,
                        AvatarIcon(size: Sizes.size12),
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
                          // Gaps.v4,
                          TextField(
                            /*
                            scrollPadding: const EdgeInsets.symmetric(
                                vertical: Sizes.size96), 
                            */
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                              hintText: "Start a thread",
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                            cursorColor: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
