import 'package:flutter/material.dart';
import 'package:login/widgets/widgets.dart';

class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Profile Settings',
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          backgroundColor: Colors.grey.shade50,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Address'),
                      leading: Icon(Icons.location_city),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                    buildDivider(),
                    // ListTile(
                    //   title: Text('Themes'),
                    //   leading: Icon(Icons.brush_outlined),
                    //   trailing: Icon(Icons.arrow_forward_ios),
                    //   onTap: () {},
                    // ),
                    // buildDivider(),
                    // ListTile(
                    //   title: Text('Credits'),
                    //   leading: Icon(Icons.money),
                    //   trailing: Icon(Icons.arrow_forward_ios),
                    //   onTap: () {},
                    // ),
                    // buildDivider(),
                    // ListTile(
                    //   title: Text('Language'),
                    //   leading: Icon(Icons.language_outlined),
                    //   trailing: Icon(Icons.arrow_forward_ios),
                    //   onTap: () {},
                    // ),
                  ],
                ),
                margin: const EdgeInsets.all(30),
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
