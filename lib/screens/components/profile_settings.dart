import 'package:flutter/material.dart';
// import 'package:login/widgets/widgets.dart';

class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
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
            'Profile Settings',
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          backgroundColor: Colors.grey.shade50,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 0,
                color: Colors.grey.shade50,
                child: Center(
                  child: Image.network(
                    'https://www.pavilionweb.com/wp-content/uploads/2017/03/man-300x300.png',
                    height: 300,
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                ),
                margin: const EdgeInsets.all(30),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                elevation: 3,
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Name + Last Name'),
                      leading: Icon(Icons.person),
                    ),
                    ListTile(
                      title: Text('Birth Date'),
                      leading: Icon(Icons.cake),
                    ),
                    ListTile(
                      title: Text('Phone Number'),
                      leading: Icon(Icons.phone),
                    ),
                    ListTile(
                      title: Text('Address'),
                      leading: Icon(Icons.location_city),
                    ),
                  ],
                ),
              ),
              Container(
                // height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      'lib/assets/images/gear.png',
                      color: const Color.fromRGBO(255, 255, 255, 0.15),
                      colorBlendMode: BlendMode.modulate,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            'Here You can change Your personal information.',
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 18,
                                height: 10),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: floatingButton,
          elevation: 10,
          tooltip: 'Edit profile information',
          child: Icon(
            Icons.edit,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
