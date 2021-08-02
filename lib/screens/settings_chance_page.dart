import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:login/api/services/lavapp_backend.dart';
import 'package:provider/provider.dart';

import 'LogIn.dart';
import 'components/change_pass.dart';

class ChangeSettings extends StatelessWidget {
  const ChangeSettings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final dataUser = Provider.of<ServicesApi>(context).getLoginModel ?? null;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Actualizar Datos',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ChangePassword()));
              },
              icon: Icon(
                Icons.lock_open_outlined,
                color: Colors.white,
              )),
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            _FirstName(),
            _LastName(),
            _TelNumber(),
            _Address(),
            SizedBox(
              height: 60,
            ),
            MaterialButton(
                onPressed: () async {
                  final res =
                      await Provider.of<ServicesApi>(context, listen: false)
                          .putDataUser();
                  if (res) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        'Los datos fueron actualizados satisfactoriamente',
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      duration: Duration(seconds: 5),
                    ));
                    return Navigator.pop(context);
                  }
                  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.blue,
                    content: Text(
                      'Ocurrío algo inesperado. Por favor contacte a la lavandería',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    duration: Duration(seconds: 5),
                  ));
                },
                // color: Color(0xFF2EC9FF),
                child: Text('Actualizar Datos',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                color: LogIn.floatingButton,
                // elevation: 10,
                minWidth: 200,
                height: 50,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
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
                          '',
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 18),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _FirstName extends StatelessWidget {
  const _FirstName({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.fromLTRB(20, 30, 20, 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Nombre:',
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: TextFormField(
                style: TextStyle(color: LogIn.darker),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    // labelText: '${dataUser.user.person.firstName}',
                    labelStyle: TextStyle(fontSize: 15)),
                onChanged: (value) {
                  Provider.of<ServicesApi>(context, listen: false).firstName =
                      value;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TelNumber extends StatelessWidget {
  const _TelNumber({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.fromLTRB(20, 8, 20, 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                'Teléfono o Celular:',
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: TextFormField(
                  style: TextStyle(color: LogIn.darker),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      // labelText: '${dataUser.user.person.firstName}',
                      labelStyle: TextStyle(fontSize: 15)),
                  onChanged: (value) {
                    Provider.of<ServicesApi>(context, listen: false).telNumber =
                        value;
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class _LastName extends StatelessWidget {
  const _LastName({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.fromLTRB(20, 8, 20, 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Apellido:',
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: TextFormField(
                style: TextStyle(color: LogIn.darker),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    // labelText: '${dataUser.user.person.firstName}',
                    labelStyle: TextStyle(fontSize: 15)),
                onChanged: (value) {
                  Provider.of<ServicesApi>(context, listen: false).lastName =
                      value;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Address extends StatelessWidget {
  const _Address({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.fromLTRB(20, 8, 20, 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              leading: Icon(Icons.location_city),
              title: Text(
                'Dirección:',
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: TextFormField(
                style: TextStyle(color: LogIn.darker),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    // labelText: '${dataUser.user.person.firstName}',
                    labelStyle: TextStyle(fontSize: 15)),
                onChanged: (value) {
                  Provider.of<ServicesApi>(context, listen: false).address =
                      value;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
