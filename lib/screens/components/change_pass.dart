import 'package:flutter/material.dart';
import 'package:login/api/services/lavapp_backend.dart';
import 'package:login/screens/settings.dart';
import 'package:provider/provider.dart';

import '../LogIn.dart';
// import 'package:login/widgets/widgets.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    final newPassword = Provider.of<ServicesApi>(context).getPassword;
    final repetiPassword = Provider.of<ServicesApi>(context).getPasswordR;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Actualizar Contraseña',
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
                    margin: EdgeInsets.only(bottom: 45),
                    child: TextFormField(
                      obscureText: true,
                      style: TextStyle(color: LogIn.darker),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Nueva Contraseña',
                        prefixIcon: Icon(Icons.lock_outline),
                        labelStyle: TextStyle(fontSize: 15),
                      ),
                      onChanged: (value) {
                        Provider.of<ServicesApi>(context, listen: false)
                            .setPassword = value;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 45),
                    child: TextFormField(
                      // key: _formKey,
                      obscureText: true,
                      style: TextStyle(color: LogIn.darker),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Repetir Contraseña',
                        prefixIcon: Icon(Icons.lock_outline),
                        labelStyle: TextStyle(fontSize: 15),
                      ),
                      onChanged: (value) {
                        Provider.of<ServicesApi>(context, listen: false)
                            .setPasswordR = value;
                      },
                    ),
                  ),
                  Container(
                      alignment: Alignment.bottomRight,
                      child: MaterialButton(
                          onPressed: () async {
                            if (newPassword == '' && repetiPassword == '') {
                              return ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: LogIn.darker,
                                content: Text(
                                  'Los campos deben estar llenos.',
                                  style: TextStyle(fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                                duration: Duration(seconds: 5),
                              ));
                            } else {
                              if (newPassword == repetiPassword) {
                                final res = await Provider.of<ServicesApi>(
                                        context,
                                        listen: false)
                                    .putDataUser();
                                if (res == true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: Colors.blue,
                                          content: Text(
                                              'Contraseña actualizada satisfactoriamente')));
                                  return Navigator.pop(context);
                                } else {
                                  return ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: LogIn.darker,
                                    content: Text(
                                      'Error Inesperado! Revise su conexión o contacte la lavandería',
                                      style: TextStyle(fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    duration: Duration(seconds: 5),
                                  ));
                                }
                              }
                              return ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: LogIn.darker,
                                content: Text(
                                  'Los campos deben ser iguales',
                                  style: TextStyle(fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                                duration: Duration(seconds: 5),
                              ));
                            }
                          },
                          child: Text('Actualizar',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          color: LogIn.floatingButton,
                          minWidth: 100,
                          height: 50,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
