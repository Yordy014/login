import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';
import 'package:login/screens/components/laundry_search.dart';
import 'package:login/screens/orders.dart';
import 'package:login/screens/settings.dart';
// import 'package:provider/provider.dart';

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//         create: (_) => new _SwtichPage(),
//         child: Scaffold(
//           body: _Pages(),
//           bottomNavigationBar: _Navigation(),
//         ));
//   }
// }

// class _Navigation extends StatelessWidget {
//   static const Color bottomBarColor = Color(0xfff2b3b6);
//   static const Color floatingButtonColor = Color(0xffe38b90);

//   @override
//   Widget build(BuildContext context) {
//     final navigatorController = Provider.of<_SwtichPage>(context);

//     return CurvedNavigationBar(
//       color: bottomBarColor,
//       backgroundColor: Colors.grey.shade50,
//       buttonBackgroundColor: floatingButtonColor,
//       height: 70,
//       animationDuration: Duration(milliseconds: 275),
//       animationCurve: Curves.easeOutSine,
//       index: navigatorController.pageInitial,
//       items: <Widget>[
//         Icon(
//           Icons.shopping_basket_outlined,
//           size: 25,
//           color: Colors.white,
//         ),
//         Icon(
//           Icons.home,
//           size: 40,
//           color: Colors.white,
//         ),
//         Icon(
//           Icons.menu,
//           size: 25,
//           color: Colors.white,
//         )
//       ],
//       onTap: (i) => navigatorController.pageInitial = i,
//     );
//   }
// }

// class _Pages extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final navigatorController = Provider.of<_SwtichPage>(context);
//     return PageView(
//       controller: navigatorController.pageController,
//       physics: NeverScrollableScrollPhysics(),
//       children: [Orders(), LaundrySearch(), Settings()],
//     );
//   }
// }

// class _SwtichPage with ChangeNotifier {
//   int _pageInitial = 1;
//   PageController _pageController = new PageController();

//   int get pageInitial => this._pageInitial;
//   set pageInitial(int value) {
//     this._pageInitial = value;
//     _pageController.animateToPage(value,
//         duration: Duration(milliseconds: 275), curve: Curves.easeOutSine);
//     notifyListeners();
//   }

//   PageController get pageController => this._pageController;
// }

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
        backgroundColor: Colors.grey.shade50,
        buttonBackgroundColor: floatingButton,
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
