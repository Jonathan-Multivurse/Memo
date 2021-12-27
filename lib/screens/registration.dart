import 'package:flutter/material.dart';
import 'package:ppm/widgets/registration/form.dart';

class RegScreen extends StatelessWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: RegForm());
  }
}
