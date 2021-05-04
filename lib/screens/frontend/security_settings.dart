import 'package:flutter/material.dart';
import 'package:login/widgets/widgets.dart';

class SecuritySettings extends StatefulWidget {
  @override
  _SecuritySettingsState createState() => _SecuritySettingsState();
}

class _SecuritySettingsState extends State<SecuritySettings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Security Settings',
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
                      title: Text('Change Password'),
                      leading: Icon(Icons.vpn_key),
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
