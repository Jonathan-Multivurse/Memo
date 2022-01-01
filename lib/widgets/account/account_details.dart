import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ppm/components/avatar_model.dart';
import 'package:ppm/components/fab_button_model.dart';
import 'package:ppm/components/confirmation_model.dart';
import 'package:ppm/routes/routes.dart';
import 'package:ppm/theme/theme.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    var height = device.width;
    var user = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Column(
      children: [
        Material(
          elevation: 1,
          child: Container(
            height: height * 0.75,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FabButtonModel(
                        tag: 'tag1',
                        onPressed: () {
                          Navigator.pushNamed(context, NotificationsRoute);
                        },
                        child: Icon(
                          Icons.notifications,
                          color: Colors.green[500],
                          size: 25,
                        ),
                      ),
                      FabButtonModel(
                        tag: 'tag2',
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Center(
                                    child: ConfirmationModel(
                                        title: 'Account Logout',
                                        data:
                                            'Are you sure you want to logout?',
                                        height: 225,
                                        width: 300,
                                        padding: EdgeInsets.all(20),
                                        button: 'Yes',
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, AuthenticationRoute);
                                        }));
                              });
                        },
                        child: Icon(
                          Icons.logout,
                          color: Colors.green[500],
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                AvatarModel(
                  image: AssetImage(
                    'lib/assets/images/user.png',
                  ),
                  radius: 50,
                ),
                Container(
                  padding: EdgeInsets.only(top: 5),
                  child: FutureBuilder<DocumentSnapshot>(
                    future: users.doc(user).get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Something went wrong");
                      }

                      if (snapshot.hasData && !snapshot.data!.exists) {
                        return Text("Document does not exist");
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        Map<String, dynamic> data =
                            snapshot.data!.data() as Map<String, dynamic>;
                        return Column(
                          children: [
                            Text(
                              "${data['firstName']} ${data['lastName']}"
                                  .toUpperCase(),
                              style: theme.textTheme.subtitle1,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5),
                              child: Text('${data['email']}',
                                  style: theme.textTheme.subtitle2),
                            ),
                          ],
                        );
                      }

                      return Text("loading");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Container()
      ],
    );
  }
}
