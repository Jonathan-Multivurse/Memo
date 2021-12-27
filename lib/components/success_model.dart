import 'package:flutter/material.dart';
import 'package:ppm/components/button_model.dart';
import 'package:ppm/theme/theme.dart';

class SuccessModel extends StatelessWidget {
  final String data;
  final double height;
  final double width;
  final EdgeInsets padding;
  final void Function()? onPressed;

  const SuccessModel({
    Key? key,
    required this.data,
    required this.height,
    required this.width,
    required this.padding,
    required this.onPressed
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
          Text('Success',
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
          ButtonModel(
            height: 50,
            width: 200,
            padding: EdgeInsets.all(0),
            name: 'Continue',
            textStyle: theme.textTheme.button!,
            style: theme.textButtonTheme.style!,
            onPressed: onPressed
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
