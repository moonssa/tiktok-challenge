import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class AvatarIcon extends StatelessWidget {
  const AvatarIcon({super.key, required this.size});
  final double size;
  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black54),
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        backgroundImage: NetworkImage(
            'https://i.pravatar.cc/200?img=${faker.randomGenerator.integer(70)}'),
        radius: size,
      ),
    );
  }
}
