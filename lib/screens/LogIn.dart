import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/screens/frontend/home.dart';
import 'SignUp.dart';

class LogIn extends StatelessWidget {
  static const Color bottomBar = Color(0xfff2b3b6);
  static const Color floatingButton = Color(0xffe38b90);
  static const Color darker = Color(0xffc2343d);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

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
                image: AssetImage('lib/assets/images/signin.png'),
                fit: BoxFit.cover,
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
                          style: TextStyle(color: darker),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Username',
                              prefixIcon: Icon(Icons.person_outline),
                              labelStyle: TextStyle(fontSize: 15)),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white10,
                      child: TextFormField(
                        obscureText: true,
                        style: TextStyle(color: darker),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock_outline),
                            labelStyle: TextStyle(fontSize: 15)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                      child: Center(
                          child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Forgot your password?',
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
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          color: floatingButton,
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
                              text: TextSpan(children: [
                        TextSpan(
                            text: "Don't have an account yet?",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey.shade700)),
                        TextSpan(
                            text: '  Sign Up',
                            style:
                                TextStyle(color: floatingButton, fontSize: 15),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              })
                      ]))),
                    )
                  ])),
            )
          ],
        ),
      ),
    );
  }
}
