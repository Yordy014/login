import 'package:flutter/material.dart';
// import 'package:login/widgets/widgets.dart';

import '../LogIn.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Update Password',
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          backgroundColor: Colors.grey.shade50,
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 60, 8, 0),
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      obscureText: true,
                      style: TextStyle(color: LogIn.darker),
                      decoration: InputDecoration(
                          // border: InputBorder.none,
                          labelText: 'Old Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          labelStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      obscureText: true,
                      style: TextStyle(color: LogIn.darker),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'New Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          labelStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 45),
                    child: TextFormField(
                      obscureText: true,
                      style: TextStyle(color: LogIn.darker),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Repeat New Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          labelStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                  Container(
                      alignment: Alignment.bottomRight,
                      child: MaterialButton(
                          onPressed: () {},
                          child: Text('Update Password',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          color: LogIn.floatingButton,
                          minWidth: 100,
                          height: 50,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
