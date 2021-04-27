import 'package:flutter/material.dart';

class LaundrySearch extends StatefulWidget {
  @override
  _LaundrySearchState createState() => _LaundrySearchState();
}

class _LaundrySearchState extends State<LaundrySearch> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Home',
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          backgroundColor: Colors.grey.shade50,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text('This is the'),
                Text('home screen you see'),
                Text('when you get'),
                Text('into the app'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
