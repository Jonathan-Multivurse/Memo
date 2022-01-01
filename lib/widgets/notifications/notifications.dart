import 'package:flutter/material.dart';
import 'package:ppm/theme/theme.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.green[500],
        );
      },
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          child: ListTile(
            title: Text(
              'notifications',
              style: theme.textTheme.subtitle2,
            ),
          ),
          background: Container(color: Colors.green[500]),
          key: UniqueKey(),
          onDismissed: (DismissDirection direction) {
            setState(() {});
          },
        );
      },
    );
  }
}
