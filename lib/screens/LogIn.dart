import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:login/api/services/lavapp_backend.dart';
import 'package:login/screens/home.dart';
import 'package:provider/provider.dart';

import 'package:url_launcher/url_launcher.dart';

// import 'SignUp.dart';

class LogIn extends StatefulWidget {
  static const Color bottomBar = Color(0xfff2b3b6);
  static const Color floatingButton = Color(0xffe38b90);
  static const Color darker = Color(0xffc2343d);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  // Future<void> makePhoneCall() async {
  //   const url = 'tel:8096916094';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  // void customLaunch(command) async {
  //   if (await canLaunch(command)) {
  //     await launch(command);
  //   } else {
  //     print(' could not launch $command');
  //   }
  // }

  _makePhoneCall(String url) {
    launch(url);
  }

  final scaffoldkey = GlobalKey<ScaffoldState>();
  // LoginModel resAccept = new LoginModel();
  // ErrorModel resDenegate = new ErrorModel();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    final flag = Provider.of<ServicesApi>(context, listen: false);
    final flag1 = Provider.of<ServicesApi>(context).flag;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('lib/assets/images/login.jpg'),
                fit: BoxFit.cover,
              )),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              // width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('lib/assets/images/logo.png'),
                fit: BoxFit.fitHeight,
              )),
            ),
            // AppBar(
            //   toolbarHeight: MediaQuery.of(context).size.height * 0.25,
            //   title: Text(
            //     'Sign In',
            //     style: TextStyle(fontSize: 35, color: Colors.white),
            //   ),
            //   backgroundColor: Colors.transparent,
            //   centerTitle: true,
            // ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              child: Padding(
                  padding: EdgeInsets.all(23),
                  child: ListView(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
                      child: Container(
                        color: Colors.white,
                        child: TextFormField(
                          style: TextStyle(color: LogIn.darker),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Nombre de Usuario',
                              prefixIcon: Icon(Icons.person_outline,
                                  color: LogIn.floatingButton),
                              labelStyle: TextStyle(
                                  fontSize: 15, color: LogIn.floatingButton)),
                          onChanged: (value) {
                            Provider.of<ServicesApi>(context, listen: false)
                                .setEmail = value;
                          },
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white10,
                      child: TextFormField(
                          obscureText: true,
                          style: TextStyle(color: LogIn.darker),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Contraseña',
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: LogIn.floatingButton,
                              ),
                              labelStyle: TextStyle(
                                  fontSize: 15, color: LogIn.floatingButton)),
                          onChanged: (value) {
                            Provider.of<ServicesApi>(context, listen: false)
                                .setPassword = value;
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                      child: Center(
                          child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => SignUp()));
                                })
                        ]),
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: MaterialButton(
                          onPressed: () async {
                            flag.flag = true;
                            final res = await Provider.of<ServicesApi>(context,
                                    listen: false)
                                .setLogin();
                            setState(() {});

                            if (res == 'si') {
                              flag.flag = false;

                              Provider.of<ServicesApi>(context, listen: false)
                                  .getOrders();
                              // Provider.of<ServicesApi>(context, listen: false)
                              //     .getSerciesClothe();
                              return Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            }
                            if (res == 'no') {
                              flag.flag = false;

                              return ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: LogIn.darker,
                                content: Text(
                                  'El usuario y/o la contraseña esta incorrectas',
                                  style: TextStyle(fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                                duration: Duration(seconds: 5),
                              ));
                            }
                            if (res == 'no_net') {
                              flag.flag = false;

                              return ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Color(0xffFFD9A1),
                                content: Text(
                                  'No hay conección a Internet, intente más tarde.',
                                  style: TextStyle(fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                                duration: Duration(seconds: 5),
                              ));
                            }
                            if (res == 'no_server') {
                              flag.flag = false;

                              return ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Color(0xffFFD9A1),
                                content: Text(
                                  'Server en mantenimiento, intente más tarde.',
                                  style: TextStyle(fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                                duration: Duration(seconds: 5),
                              ));
                            }
                          },
                          // },
                          child: Text(
                            'Iniciar Sesión',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          color: LogIn.floatingButton,
                          // elevation: 10,
                          minWidth: 300,
                          height: 50,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Center(
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "¿Aún no tienes una cuenta?",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey.shade700)),
                                TextSpan(
                                    text:
                                        "                                       ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey.shade700)),
                                TextSpan(
                                    text:
                                        '¡Llama YA! ¡A sólo un click de distancia!',
                                    style: TextStyle(
                                        color: LogIn.floatingButton,
                                        fontSize: 17),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        setState(() {
                                          _makePhoneCall('tel:8096916094');
                                        });
                                      })
                              ]))),
                    ),
                  ])),
            ),

            (flag1)
                ? Container(
                    color: Colors.black26,
                    // width: double.infinity,
                    // height: double.infinity,
                    child: CircularProgress())
                : Container()
          ],
        ),
      ),
    );
  }
}

class CircularProgress extends StatefulWidget {
  @override
  _CircularProgressState createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: CircularProgressIndicator(
          color: LogIn.floatingButton,
        ),
      ),
    );
  }
}
