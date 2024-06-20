import 'package:flutter/material.dart';

class AvatarImg extends StatelessWidget {
  const AvatarImg({
    super.key,
    required this.size,
    required this.imgUrl,
  });
  final String imgUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black54),
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        backgroundImage: NetworkImage(imgUrl),
        radius: size,
      ),
    );
  }
}
