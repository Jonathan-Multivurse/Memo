import 'package:flutter/material.dart';

class FabButtonModel extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  final String tag;
  const FabButtonModel({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: tag,
      mini: false,
      backgroundColor: Colors.white,
      child: child,
      elevation: 1,
      hoverElevation: 0.5,
      focusElevation: 0,
      highlightElevation: 0,
      onPressed: onPressed,
    );
  }
}
