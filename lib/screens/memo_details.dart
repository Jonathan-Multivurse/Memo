import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ppm/components/confirmation_model.dart';
import 'package:ppm/components/modal.dart';
import 'package:ppm/screens/edit_form.dart';
import 'package:ppm/state/edit_memo/edit_memo.dart';
import 'package:ppm/theme/theme.dart';
import 'package:ppm/widgets/account/edit_modal.dart';

class MemoArguments {
  final String id;
  final String title;
  final String type;
  final String description;
  final String from;
  final String recipientName;
  final String recipientAddress;
  final String relationship;

  MemoArguments(
    this.id,
    this.title,
    this.type,
    this.description,
    this.from,
    this.recipientName,
    this.recipientAddress,
    this.relationship,
  );
}

class MemoDetailsScreen extends StatefulWidget {
  const MemoDetailsScreen({Key? key}) : super(key: key);

  @override
  State<MemoDetailsScreen> createState() => _MemoDetailsScreenState();
}

class _MemoDetailsScreenState extends State<MemoDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MemoArguments;
    var user = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Material(
          elevation: 1,
          child: AppBar(
            toolbarHeight: 70,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'Memo Details',
              style: theme.textTheme.headline3,
            ),
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
            actions: <Widget>[
              IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                color: Colors.green[500],
                icon: Icon(Icons.settings),
                onPressed: () {
                  showFloatingModalBottomSheet(
                    context: context,
                    builder: (context) => EditModal(
                      onPressedEdit: () {
                        context.read<EditCubit>().showForm();
                        Navigator.pop(context);
                      },
                      onPressedDelete: () {
                        FirebaseFirestore.instance
                            .collection('memos')
                            .doc(args.id)
                            .delete()
                            .then((value) => {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return Center(
                                          child: ConfirmationModel(
                                            title: 'Memo Deleted!',
                                            data:
                                                'You have successuly removed this memo',
                                            height: 200,
                                            width: 300,
                                            padding: EdgeInsets.all(20),
                                            onPressed: () {
                                              FirebaseFirestore.instance
                                                  .collection("notifications")
                                                  .add({
                                                "uid": user,
                                                "info":
                                                    'Memo deleted successfully!',
                                              });
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                            },
                                            button: 'Got it',
                                          ),
                                        );
                                      }),
                                });
                      },
                      onPressedCancel: () {
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
              )
            ],
            automaticallyImplyLeading: false,
          ),
        ),
      ),
      body: BlocBuilder<EditCubit, bool>(
        builder: (context, state) {
          return state == false
              ? Container(
                  padding: EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      Text(
                        'Title',
                        style: theme.textTheme.headline3,
                      ),
                      SizedBox(height: 10),
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 0.5,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)),
                          child: Flexible(
                              child: Text(
                            args.title,
                            style: theme.textTheme.subtitle2,
                          )),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Property type',
                        style: theme.textTheme.headline3,
                      ),
                      SizedBox(height: 10),
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 0.5,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)),
                          child: Flexible(
                              child: Text(
                            args.type,
                            style: theme.textTheme.subtitle2,
                          )),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Description',
                        style: theme.textTheme.headline3,
                      ),
                      SizedBox(height: 10),
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 0.5,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)),
                          child: Flexible(
                              child: Text(
                            args.description,
                            style: theme.textTheme.subtitle2,
                          )),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Obtained from',
                        style: theme.textTheme.headline3,
                      ),
                      SizedBox(height: 10),
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 0.5,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)),
                          child: Flexible(
                              child: Text(
                            args.from,
                            style: theme.textTheme.subtitle2,
                          )),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Recipient',
                        style: theme.textTheme.headline3,
                      ),
                      SizedBox(height: 10),
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 0.5,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)),
                          child: Flexible(
                              child: Text(
                            args.recipientName,
                            style: theme.textTheme.subtitle2,
                          )),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Address',
                        style: theme.textTheme.headline3,
                      ),
                      SizedBox(height: 10),
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 0.5,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)),
                          child: Flexible(
                              child: Text(
                            args.recipientAddress,
                            style: theme.textTheme.subtitle2,
                          )),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Relationship',
                        style: theme.textTheme.headline3,
                      ),
                      SizedBox(height: 10),
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 0.5,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)),
                          child: Flexible(
                              child: Text(
                            args.relationship,
                            style: theme.textTheme.subtitle2,
                          )),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ))
              : EditForm(
                  id: args.id,
                  title: args.title,
                  dropDown: args.type,
                  desc: args.description,
                  from: args.from,
                  name: args.recipientName,
                  address: args.recipientAddress,
                  rnship: args.relationship);
        },
      ),
    );
  }
}
