import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ppm/components/confirmation_model.dart';
import 'package:ppm/theme/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ppm/widgets/account/memo_empty.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  var user = FirebaseAuth.instance.currentUser!.uid;
  final notiRef = FirebaseFirestore.instance.collection("notifications");
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
        child: FutureBuilder<QuerySnapshot>(
          future: notiRef.where('uid', isEqualTo: user).get(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasError) return Text("Something went wrong");

            if (!snapshot.hasData)
              return Padding(
                  padding: EdgeInsets.all(50), child: Text("0 Notifications!"));
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.green[500],
              ));
            final List<Widget> notiList = snapshot.data!.docs
                .map((data) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Dismissible(
                          child: ListTile(
                            title: Text(
                              data['info'],
                              style: theme.textTheme.subtitle2,
                            ),
                          ),
                          background: Container(color: Colors.green[500]),
                          key: UniqueKey(),
                          onDismissed: (DismissDirection direction) {
                            notiRef.doc(data.id).delete().then((value) => {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return Center(
                                          child: ConfirmationModel(
                                            title: 'Notification Deleted!',
                                            data:
                                                'You have successuly removed this notification',
                                            height: 200,
                                            width: 300,
                                            padding: EdgeInsets.all(20),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              setState(() {});
                                            },
                                            button: 'Got it',
                                          ),
                                        );
                                      }),
                                });
                          },
                        ),
                        Divider(color: Colors.green[500])
                      ],
                    ))
                .toList();
            return Padding(
              padding: EdgeInsets.only(top: 9),
              child: ListView(
                children: notiList,
              ),
            );
          },
        ),
      ),
    );
  }
}
