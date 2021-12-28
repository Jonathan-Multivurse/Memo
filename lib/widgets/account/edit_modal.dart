import 'package:flutter/material.dart';
import 'package:ppm/theme/theme.dart';

class EditModal extends StatelessWidget {
  final void Function()? onPressedEdit;
  final void Function()? onPressedDelete;
  final void Function()? onPressedCancel;

  const EditModal(
      {required this.onPressedEdit,
      required this.onPressedDelete,
      required this.onPressedCancel});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          ListTile(
            dense: false,
            contentPadding: EdgeInsets.all(0),
            minVerticalPadding: 0,
            onTap: onPressedEdit,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Edit', style: theme.textTheme.subtitle2),
              ],
            ),
          ),
          Divider(),
          ListTile(
            dense: false,
            minVerticalPadding: 0,
            onTap: () {},
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Delete', style: theme.textTheme.subtitle2),
              ],
            ),
          ),
          Divider(),
          ListTile(
            dense: false,
            minVerticalPadding: 0,
            onTap: onPressedCancel,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Cancel', style: theme.textTheme.subtitle2),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
