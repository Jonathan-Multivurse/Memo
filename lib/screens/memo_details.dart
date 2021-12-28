import 'package:flutter/material.dart';
import 'package:ppm/components/modal.dart';
import 'package:ppm/theme/theme.dart';
import 'package:ppm/widgets/account/edit_modal.dart';

class MemoDetailsScreen extends StatelessWidget {
  const MemoDetailsScreen({Key? key}) : super(key: key);

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
                      onPressedEdit: () {},
                      onPressedDelete: () {},
                      onPressedCancel: () {},
                    ),
                  );
                },
              )
            ],
            automaticallyImplyLeading: false,
          ),
        ),
      ),
      body: Container(
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
                    'Some memo title',
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
                    'Collectibles',
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
                    'Contrary to popular belief, Lorem Ipsum is not simply random text. Contrary to popular belief, Lorem Ipsum is not simply random text. Contrary to popular belief, Lorem Ipsum is not simply random text. ',
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
                    'Contrary to popular belief, Lorem Ipsum is not simply random text.',
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
                    'Contrary to popular belief, Lorem Ipsum is not simply random text.',
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
                    'Contrary to popular belief, Lorem Ipsum is not simply random text.',
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
                    'Daughter',
                    style: theme.textTheme.subtitle2,
                  )),
                ),
              ),
              SizedBox(height: 10),
            ],
          )),
    );
  }
}
