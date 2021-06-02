import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:login/screens/frontend/profile_settings.dart';
import 'package:login/screens/frontend/security_settings.dart';
import 'package:login/widgets/widgets.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  static const Color bottomBar = Color(0xfff2b3b6);
  static const Color floatingButton = Color(0xffe38b90);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade50,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            title: Text(
              'Settings',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            backgroundColor: Colors.grey.shade50,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            'https://www.pavilionweb.com/wp-content/uploads/2017/03/man-300x300.png',
                            height: 90,
                            width: 90,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            'Yordy Rodriguez',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text('Profile Settings'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileSettings()));
                          },
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                  elevation: 5,
                  margin: const EdgeInsets.fromLTRB(20, 8, 20, 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('Security'),
                        leading: Icon(Icons.lock_outline),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecuritySettings()));
                        },
                      ),
                      buildDivider(),
                      ListTile(
                        title: Text('Themes'),
                        leading: Icon(Icons.brush_outlined),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {},
                      ),
                      buildDivider(),
                      ListTile(
                        title: Text('Credits'),
                        leading: Icon(Icons.money),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {},
                      ),
                      buildDivider(),
                      ListTile(
                          title: Text('Language'),
                          leading: Icon(Icons.language_outlined),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Working on It, pop Up for language selection
                            showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  int selectedRadio = 0;
                                  return AlertDialog(
                                    content: StatefulBuilder(
                                      builder: (BuildContext context,
                                          StateSetter setState) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: List<Widget>.generate(4,
                                              (int index) {
                                            return Radio<int>(
                                              value: index,
                                              groupValue: selectedRadio,
                                              onChanged: (int value) {
                                                setState(() =>
                                                    selectedRadio = value);
                                              },
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  );
                                });
                          })
                    ],
                  ),
                  margin: const EdgeInsets.all(30),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                SwitchListTile(
                    value: true,
                    activeColor: floatingButton,
                    activeTrackColor: bottomBar,
                    contentPadding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    title: Text(
                      'Receive Notifications',
                      style: TextStyle(fontSize: 17),
                    ),
                    onChanged: (val) {}),
                SwitchListTile(
                    value: false,
                    activeColor: floatingButton,
                    activeTrackColor: bottomBar,
                    contentPadding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    title: Text('Dark Mode', style: TextStyle(fontSize: 17)),
                    onChanged: (val) {})
              ],
            ),
          )),
    );
  }
}
