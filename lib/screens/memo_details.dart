import 'package:flutter/material.dart';
import 'package:ppm/theme/theme.dart';

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
                  // do something
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
                    'afjebjk adfjnerj erfjnerf nerfjnerfn ejfgner  drfaerfg ergferq erfg eqrg egferq gerqg erfgerg e erger ergerg erger ergreg eqrgerg erwgeqg ergertg eqghert ',
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
                    'afj eqrgerg erwgeqg ergertg eqghert ',
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
                    'afjebeg eqghert ',
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
                    'afrfg erger ergregg ergertg eqghert ',
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
                    'aerg erwgeqg ergertg',
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
