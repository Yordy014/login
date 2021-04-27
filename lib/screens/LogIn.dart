import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'SignUp.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('lib/assets/images/login2.jpg'),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          )),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 250),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: Padding(
              padding: EdgeInsets.all(23),
              child: ListView(children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Container(
                    color: Colors.white,
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Usuario',
                          prefixIcon: Icon(Icons.person_outline),
                          labelStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white10,
                  child: TextFormField(
                    obscureText: true,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Contraseña',
                        prefixIcon: Icon(Icons.lock_outline),
                        labelStyle: TextStyle(fontSize: 15)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        'Ingresar',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      color: Color(0xff0277bd),
                      elevation: 0,
                      minWidth: 400,
                      height: 50,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text('Olvidé mi contraseña',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Center(
                      child: RichText(
                          text: TextSpan(children: [
                    TextSpan(
                        text: '¿Aún no tienes cuenta?',
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                    TextSpan(
                        text: '  Registrarme',
                        style:
                            TextStyle(color: Color(0xff0277bd), fontSize: 15),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          })
                  ]))),
                )
              ])),
        )
      ],
    );
  }
}
