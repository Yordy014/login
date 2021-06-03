import 'package:flutter/material.dart';
// import 'package:login/api/models/login.dart';
// import 'package:login/screens/LogIn.dart';
// import 'package:login/screens/testing/testing.dart';
import 'package:provider/provider.dart';

import 'api/services/lavapp_backend.dart';
// import 'package:login/screens/SignUp.dart';
// import 'package:login/challenges/rectangle_animation_page.dart';
// import 'package:login/screens/animations.dart';
import 'package:login/screens/frontend/home.dart';
// import 'package:login/screens/test_circular_progress.dart';
// import 'package:login/screens/headers_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const Color bottomBar = Color(0xfff2b3b6);
  static const Color floatingButton = Color(0xffe38b90);
  static const Color darker = Color(0xffc2343d);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserServices(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textSelectionTheme:
                  TextSelectionThemeData(cursorColor: floatingButton),
              primaryColorLight: bottomBar,
              primaryColorDark: darker,
              primaryColor: floatingButton,
              accentColor: floatingButton),
          // darkTheme: ,
          home: Home()),
    );
    // home: SignUp());
    // return MaterialApp(home: SignUp());
  }
}
