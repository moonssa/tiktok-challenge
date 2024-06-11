// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:tiktok_challenge/constants/gaps.dart';
// import 'package:tiktok_challenge/constants/sizes.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(Sizes.size12),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Image.asset(
//             "assets/images/twitterX.png",
//             scale: 6.0,
//           ),
//         ),
//         body: Column(
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     const CircleAvatar(
//                       backgroundImage: NetworkImage(
//                           "https://avatars.githubusercontent.com/u/90151845?v=4"),
//                       radius: Sizes.size24,
//                     ),
//                     Positioned(
//                       bottom: -10,
//                       right: -10,
//                       child: Container(
//                           width: 30,
//                           height: 30,
//                           alignment: Alignment.center,
//                           // color:Colors.white,
//                           decoration: const BoxDecoration(
//                             color: Colors.white,
//                             shape: BoxShape.circle,
//                           ),
//                           child: const FaIcon(
//                             FontAwesomeIcons.circlePlus,
//                           )),
//                     ),
//                   ],
//                 ),
//                 Gaps.h16,
//                 const Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "pubity",
//                                 style: TextStyle(
//                                   fontSize: Sizes.size14,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Gaps.h4,
//                               FaIcon(FontAwesomeIcons.circleCheck,
//                                   size: Sizes.size14),
//                             ],
//                           ),
//                           Row(children: [
//                             Text("2m"),
//                             Gaps.h6,
//                             FaIcon(
//                               FontAwesomeIcons.ellipsis,
//                             )
//                           ])
//                         ],
//                       ),
//                       Gaps.v10,
//                       Text(
//                         "Vine after seeing the Threads logo unvelied",
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                           fontSize: Sizes.size16,
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             Row(
//               children: [
//                 Container(
//                   width: 1, // 선의 너비
//                   height: 200, // 선의 높이
//                   color: Colors.grey, // 선 색상
//                 ),
//                 const Column(
//                   children: [
//                     Row(
//                       children: [
//                         FaIcon(FontAwesomeIcons.heart),
//                         FaIcon(FontAwesomeIcons.message),
//                         FaIcon(FontAwesomeIcons.infinity),
//                         FaIcon(FontAwesomeIcons.fly)
//                       ],
//                     )
//                   ],
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        body: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://avatars.githubusercontent.com/u/90151845?v=4"),
                      radius: Sizes.size24,
                    ),
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
                const Expanded(
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
                                "pubity",
                                style: TextStyle(
                                  fontSize: Sizes.size14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Gaps.h4,
                              FaIcon(FontAwesomeIcons.circleCheck,
                                  size: Sizes.size14),
                            ],
                          ),
                          Row(
                            children: [
                              Text("2m"),
                              Gaps.h6,
                              FaIcon(
                                FontAwesomeIcons.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Gaps.v4,
                      Text(
                        "Vine after seeing the Threads logo unveiled",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
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
                    width: 2, // 선의 너비
                    height: 200, // 선의 높이
                    color: Colors.grey, // 선 색상
                  ),
                  Gaps.h10,
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: Sizes.size28,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                              height: 180,
                              width: double.infinity,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: const EdgeInsets.only(
                                      top: Sizes.size10,
                                      bottom: Sizes.size10,
                                      right: Sizes.size10,
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        Sizes.size10,
                                      ),
                                    ),
                                    child: Image.asset(
                                      "assets/images/IMG_dron${index + 1}.jpeg",
                                    ),
                                  );
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
                                FontAwesomeIcons.message,
                                size: Sizes.size18,
                                color: Colors.grey.shade600,
                              ),
                              Gaps.h16,
                              FaIcon(
                                FontAwesomeIcons.infinity,
                                size: Sizes.size18,
                                color: Colors.grey.shade600,
                              ),
                              Gaps.h16,
                              FaIcon(
                                FontAwesomeIcons.fly,
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
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://avatars.githubusercontent.com/u/90151845?v=4"),
                          radius: Sizes.size12,
                        ),
                      ),
                      Positioned(
                        left: 28,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://avatars.githubusercontent.com/u/90151845?v=4"),
                          radius: Sizes.size14,
                        ),
                      ),
                      Positioned(
                        left: 18,
                        top: 32,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://avatars.githubusercontent.com/u/90151845?v=4"),
                          radius: Sizes.size10,
                        ),
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
            Divider(
              height: 2,
              thickness: 1,
              color: Colors.grey.shade400,
            )
          ],
        ),
      ),
    );
  }
}
