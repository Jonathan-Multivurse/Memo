import 'package:flutter/material.dart';
import 'package:ppm/widgets/account/account_details.dart';
import 'package:ppm/widgets/account/memo_empty.dart';
import 'package:ppm/widgets/account/memo_tile.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  List<String> tileImages = [
    'lib/assets/images/heirlooms.png',
    'lib/assets/images/collectibles.png',
    'lib/assets/images/books.png',
    'lib/assets/images/furniture.png',
    'lib/assets/images/jewelry.png',
  ];
  List<String> title = [
    'memo title',
    'memo title',
    'memo title',
    'memo title',
    'memo title'
  ];

  List<String> type = [
    'Heirloom',
    'Book',
    'Furniture',
    'Jewelry',
    'Collectibles',
  ];
  List<String> details = [
    'memo description',
    'memo description',
    'memo description',
    'memo description',
    'memo description',
  ];

  List<String> date = [
    'Jan 10, 2021',
    'Feb 10, 2021',
    'Mar 10, 2021',
    'Apr 10, 2021',
    'May 10, 2021',
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        child: Column(
          children: [
            AccountDetails(),
            MemoEmpty()
            // MemoTile(
            //   title: title,
            //   type: type,
            //   detials: details,
            //   date: date,
            // ),
          ],
        ),
      ),
    );
  }
}
