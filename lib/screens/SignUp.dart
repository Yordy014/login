import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    // SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.top/bottom]);

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Container(
      child: Column(
        children: [
          Container(
            child: Stack(
              children: [
                //Top Design
                Container(
                  //Top Gradient Blue
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(80)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment(0.8, 0.6),
                        colors: [Color(0xff0277bd), Color(0xff29b6f6)],
                      )),
                ),
                Container(
                  //User Icon
                  child: Image(
                    image: AssetImage('lib/assets/images/user.png'),
                    height: 128,
                    width: 128,
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          Container(
            //Bottom Stuff
            width: MediaQuery.of(context).size.width,
            // color: Color(0xff0277bd),
            child: Padding(
              padding: EdgeInsets.all(23),
              child: ListView(children: [
                Container(
                  color: Colors.white,
                  child: TextFormField(
                    obscureText: true,
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
