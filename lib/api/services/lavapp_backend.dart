import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:login/api/models/login.dart';

var _urlApi = 'https://lavapp-backend.herokuapp.com/api';

class UserServices with ChangeNotifier {
  String _email = 'odalmi';
  String _password = '123456';

  String get getEmail => this._email;
  String get getPassword => this._password;

  set setEmail(String value) {
    this._email = value;
    notifyListeners();
  }

  set setPassword(String value) {
    this._password = value;
    notifyListeners();
  }

  getLogin(String email, password) async {
    final url = '$_urlApi/usuario/login';
    final data = new Login(email: email, password: password);
    final req = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: loginToJson(data));
    final res = jsonDecode(req.body);
    return res;
  }
}
