import 'package:flutter/material.dart';
import 'package:ppm/screens/account.dart';
import 'package:ppm/screens/home.dart';
import 'package:ppm/screens/memo.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    Container(child: Home()),
    Container(child: Memo()),
    Container(child: Account()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Theme(
        data: ThemeData(),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Icon(
                    Icons.home,
                    size: 28,
                  )),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Icon(
                    Icons.assignment,
                    size: 26,
                  )),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Icon(
                    Icons.person,
                    size: 30,
                  )),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green[500],
          unselectedItemColor: Colors.grey[700],
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
