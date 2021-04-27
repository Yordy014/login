import 'package:flutter/material.dart';
// import 'package:login/screens/LogIn.dart';
// import 'package:login/screens/SignUp.dart';
// import 'package:login/challenges/rectangle_animation_page.dart';
// import 'package:login/screens/animations.dart';
import 'package:login/screens/frontend/home.dart';
// import 'package:login/screens/test_circular_progress.dart';
// import 'package:login/screens/headers_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    return MaterialApp(home: Home());
    // return MaterialApp(home: SignUp());
  }
}
