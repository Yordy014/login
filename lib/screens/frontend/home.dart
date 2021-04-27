import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';
import 'package:login/screens/frontend/laundry_search.dart';
import 'package:login/screens/frontend/orders.dart';
import 'package:login/screens/frontend/settings.dart';

class Home extends StatefulWidget {
  // final List<Widget> screens;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const Color bottomBar = Color(0xfff2b3b6);
  static const Color floatingButton = Color(0xffe38b90);

  int _page = 1;
  Widget currentScreen;
  // GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      body: IndexedStack(
        index: _page,
        children: <Widget>[Orders(), LaundrySearch(), Settings()],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: bottomBar,
        backgroundColor: Colors.white,
        buttonBackgroundColor: bottomBar,
        height: 70,
        animationDuration: Duration(milliseconds: 275),
        animationCurve: Curves.easeOutSine,
        index: 1,
        items: <Widget>[
          Icon(
            Icons.shopping_basket_outlined,
            size: 25,
            color: Colors.white,
          ),
          Icon(
            Icons.home,
            size: 40,
            color: Colors.white,
          ),
          Icon(
            Icons.menu,
            size: 25,
            color: Colors.white,
          )
        ],
        onTap: (index) {
          setState(() {
            _page = index;
            // debugPrint('index: $_page');
          });
        },
      ),
    );
  }
}
