import 'package:flutter/material.dart';
import 'package:ppm/widgets/memo/form.dart';
import 'package:ppm/widgets/memo/header.dart';

class Memo extends StatefulWidget {
  const Memo({Key? key}) : super(key: key);

  @override
  _MemoState createState() => _MemoState();
}

class _MemoState extends State<Memo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [MemoHeader(), MemoForm()],
    ));
  }
}
