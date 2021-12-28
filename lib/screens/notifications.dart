import 'package:flutter/material.dart';
import 'package:ppm/theme/theme.dart';
import 'package:ppm/widgets/notifications/notifications.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Material(
          elevation: 1,
          child: AppBar(
            toolbarHeight: 70,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text('Notifications', style: theme.textTheme.headline3),
            centerTitle: true,
            leading: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              color: Colors.green[500],
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            automaticallyImplyLeading: false,
          ),
        ),
      ),
      body: Container(
        child: Notifications(),
      ),
    );
  }
}
