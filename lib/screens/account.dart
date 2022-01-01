import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ppm/components/alert_model.dart';
import 'package:ppm/routes/routes.dart';
import 'package:ppm/screens/memo_details.dart';
import 'package:ppm/widgets/account/account_details.dart';
import 'package:ppm/widgets/account/memo_empty.dart';
import 'package:ppm/widgets/account/memo_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  var user = FirebaseAuth.instance.currentUser!.uid;
  final memosRef = FirebaseFirestore.instance.collection("memos");

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Column(
        children: [
          AccountDetails(),
          Container(
            child: FutureBuilder<QuerySnapshot>(
              future: memosRef
                  .where('uid', isEqualTo: user)
                  .get()
                  .catchError((err) {
                print(err);
              }),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasError)
                  return Padding(
                    padding: const EdgeInsets.all(50),
                    child: Text("Something went wrong"),
                  );

                if (!snapshot.hasData) return MemoEmpty();

                if (snapshot.connectionState == ConnectionState.waiting)
                  return Padding(
                    padding: const EdgeInsets.all(50),
                    child: CircularProgressIndicator(
                      color: Colors.green[500],
                    ),
                  );
                final List<Widget> memoList = snapshot.data!.docs
                    .map((data) => MemoTile(
                          title: data['title'],
                          type: data['type'],
                          details: data['description'],
                          date: data['timeStamp'],
                          onTap: () {
                            Navigator.pushNamed(context, MemoDetailsRoute,
                                arguments: MemoArguments(
                                  data['title'],
                                  data['type'],
                                  data['description'],
                                  data['obtainedFrom'],
                                  data['recipientName'],
                                  data['recipientAddress'],
                                  data['relationship'],
                                ));
                          },
                        ))
                    .toList();
                return Expanded(
                  child: ListView(children: memoList),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
