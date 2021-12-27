import 'package:flutter/material.dart';
import 'package:ppm/theme/theme.dart';

class AlertModel extends StatelessWidget {
  final String data;
  final double height;
  final double width;
  final EdgeInsets padding;

  const AlertModel({
    Key? key,
    required this.data,
    required this.height,
    required this.width,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Error',
              style: theme.textTheme.headline3,
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(data,
                style: theme.textTheme.caption,
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            spreadRadius: 10,
            blurRadius: 20,
            offset: Offset(0, 3),
          ),
        ],
      ),
    );
  }
}
