import 'package:flutter/material.dart';
import 'package:ppm/components/alert_model.dart';

class PrivacyError extends StatelessWidget {
  const PrivacyError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertModel(
      padding: EdgeInsets.all(10),
      data: 'Please Accept Privacy Policy!',
      height: 200,
      width: 300,
    );
  }
}
