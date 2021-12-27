import 'package:flutter/material.dart';

class AvatarModel extends StatelessWidget {
  final double radius;
  final AssetImage image;
  const AvatarModel({
    Key? key,
    required this.radius,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: CircleAvatar(
          backgroundColor: Colors.green[200],
          radius: radius,
          backgroundImage: image),
    );
  }
}
