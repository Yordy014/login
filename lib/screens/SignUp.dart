import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatelessWidget {
  static const Color bottomBar = Color(0xfff2b3b6);
  static const Color floatingButton = Color(0xffe38b90);
  static const Color darker = Color(0xffc2343d);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    // SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.top/bottom]);

    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Sign Up',
      //     style: TextStyle(fontSize: 25),
      //   ),
      //   backgroundColor: Colors.grey.shade50,
      //   centerTitle: true,
      //   elevation: 0,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  //Top Gradient Blue
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(80)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment(0.8, 0.1),
                        colors: [
                          bottomBar,
                          floatingButton,
                        ],
                      )),
                  height: MediaQuery.of(context).size.height * 0.40,
                ),
                Container(
                  //User Icon
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage('lib/assets/images/user.png'),
                        height: 128,
                        width: 128,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(23),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                child: Container(
                  color: Colors.white,
                  child: TextFormField(
                    style: TextStyle(color: darker),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'E-mail',
                        prefixIcon: Icon(Icons.email),
                        labelStyle: TextStyle(fontSize: 15)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 0, 23, 0),
              child: Container(
                color: Colors.white,
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
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: MaterialButton(
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Home()));
                  },
                  child: Text(
                    'Sign me Up',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  color: floatingButton,
                  elevation: 0,
                  minWidth: 300,
                  height: 50,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ],
        ),
      ),
    ));
  }
}
