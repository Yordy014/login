import 'package:flutter/material.dart';
import 'package:login/api/services/notication_firebase.dart';
import 'package:login/screens/LogIn.dart';
import 'package:login/screens/home.dart';
// import 'package:login/api/models/login.dart';
// import 'package:login/screens/LogIn.dart';
// import 'package:login/screens/testing/testing.dart';
import 'package:provider/provider.dart';

import 'api/services/lavapp_backend.dart';
import 'api/services/save_login.dart';
// import 'screens/components/laundry_search.dart';
// import 'package:login/screens/SignUp.dart';
// import 'package:login/challenges/rectangle_animation_page.dart';
// import 'package:login/screens/animations.dart';
// import 'package:login/screens/test_circular_progress.dart';
// import 'package:login/screens/headers_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  if (prefs.datosUsuario.isEmpty) {
    prefs.datosUsuario = 'No logueado';
  }

  await PushNotificactionService.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static const Color bottomBar = Color(0xfff2b3b6);
  static const Color floatingButton = Color(0xffe38b90);
  static const Color darker = Color(0xffc2343d);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    final prefs = PreferenciasUsuario();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ServicesApi(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textSelectionTheme:
                  TextSelectionThemeData(cursorColor: MyApp.floatingButton),
              primaryColorLight: MyApp.bottomBar,
              primaryColorDark: MyApp.darker,
              primaryColor: MyApp.floatingButton,
              accentColor: MyApp.floatingButton),
          // darkTheme: ,
          home: (prefs.datosUsuario == 'No logueado') ? LogIn() : Home()),
    );
    // home: SignUp());
    // return MaterialApp(home: SignUp());
  }
}
