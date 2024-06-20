import 'package:flutter/material.dart';
import 'package:tiktok_challenge/constants/sizes.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: const TabBar(
        indicatorColor: Colors.black,
        indicatorWeight: 1.0,
        labelPadding: EdgeInsets.only(
          bottom: Sizes.size10,
        ),
        labelColor: Colors.black,
        tabs: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: Text("Threads",
                style: TextStyle(
                  fontSize: Sizes.size16,
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: Text("Replies",
                style: TextStyle(
                  fontSize: Sizes.size16,
                )),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 34;

  @override
  double get minExtent => 34;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
// class PersistantTabBar extends SliverPersistentHeaderDelegate {
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return const TabBar(
//       indicatorColor: Colors.black,
//       indicatorWeight: 1.0,
//       labelPadding: EdgeInsets.only(
//         bottom: Sizes.size10,
//       ),
//       labelColor: Colors.black,
//       tabs: [
//         Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: Sizes.size20,
//           ),
//           child: Text("Threads",
//               style: TextStyle(
//                 fontSize: Sizes.size16,
//               )),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: Sizes.size20,
//           ),
//           child: Text("Replies",
//               style: TextStyle(
//                 fontSize: Sizes.size16,
//               )),
//         ),
//       ],
//     );
//   }

//   @override
//   double get maxExtent => 47;

//   @override
//   double get minExtent => 47;

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }
