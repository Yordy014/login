import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:login/api/models/bill.dart';
import 'package:login/api/models/login.dart';
import 'package:login/api/models/putuser_model.dart';
import 'package:login/api/models/services.dart';

var _urlApi = 'https://lavapp-backend.herokuapp.com/api';

class ServicesApi with ChangeNotifier {
  String _email = 'yordy';
  String _password = '123456';
  String _passwordR = '';
  LoginModel _dataUser = new LoginModel();
  ServicesModel _dataService = new ServicesModel();
  BillModel _dataBill = new BillModel();

  bool _isLoading = true;

  String _firstName = '';
  String _lastName = '';
  String _telNumber = '';
  String _address = '';

  ServicesModel get dataServices => _dataService;

  bool get isLoading => this._isLoading;

  String get firstName => this._firstName;
  String get lastName => this._lastName;
  String get telNumber => this._telNumber;
  String get address => this._address;

  set isLoading(bool value) {
    this._isLoading = value;
    notifyListeners();
  }

  set dataUser(LoginModel value) {
    this._dataUser = value;
    notifyListeners();
  }

  set firstName(String value) {
    this._firstName = value;
    notifyListeners();
  }

  set lastName(String value) {
    this._lastName = value;
    notifyListeners();
  }

  set telNumber(String value) {
    this._telNumber = value;
    notifyListeners();
  }

  set address(String value) {
    this._address = value;
    notifyListeners();
  }

  String get getEmail => this._email;
  String get getPassword => this._password;
  String get getPasswordR => this._passwordR;
  LoginModel get getLoginModel => this._dataUser;
  BillModel get dataBill => this._dataBill;
  set setEmail(String value) {
    this._email = value;
    notifyListeners();
  }

  set setPassword(String value) {
    this._password = value;
    notifyListeners();
  }

  set setPasswordR(String value) {
    this._passwordR = value;
    notifyListeners();
  }

  var tapon = true;
  Future<bool> setLogin() async {
    if (this.tapon = true) {
      final url = '$_urlApi/usuario/login';
      final data = {'email': this._email, 'password': this._password};
      final req = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));
      final res = req.body;
      final bur = await jsonDecode(res);
      if (bur['ok'] == true) {
        this._dataUser = loginModelFromJson(res);
        tapon = false;
        return true;
      } else {
        tapon = false;
        return false;
      }
    } else {
      return false;
    }
  }

  // bool callOneTime = false;

  void getOrders() async {
    // if (callOneTime == false) {
    //   final url =
    //       Uri.parse('$_urlApi/bill/bycustomer/${this._dataUser.user.idUser}');
    //   final req = await http.get(url, headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //     'Authorization': 'Bearer ' + this._dataUser.token,
    //   });
    //   this._dataBill = billModelFromJson(req.body);
    //   notifyListeners();
    //   print(this._dataBill.data.length);
    // }
    // callOneTime = true;

    if (this._isLoading) {
      final url =
          Uri.parse('$_urlApi/bill/bycustomer/${this._dataUser.user.idUser}');
      final req = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + this._dataUser.token,
      });
      this._dataBill = billModelFromJson(req.body);
      this._isLoading = false;
      notifyListeners();
      print('Hola');
    }
  }

  putDataUser() async {
    final url = Uri.parse('$_urlApi/person/${this._dataUser.user.idPerson}');
    final data = {
      "first_name": (this._firstName == '')
          ? this._dataUser.user.person.firstName
          : this._firstName,
      "last_name": (this._lastName == '')
          ? this._dataUser.user.person.lastName
          : this._lastName,
      "tel_number": (this._telNumber == '')
          ? this._dataUser.user.person.telNumber
          : this._telNumber,
      "address": (this._address == '')
          ? this._dataUser.user.person.address
          : this._address,
      "id_user": this._dataUser.user.idUser,
      "password": this._password
    };
    final req = await http.put(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + this._dataUser.token,
        },
        body: jsonEncode(data));

    final res = putUserModelFromJson(req.body);

    if (res.ok == true) {
      this._dataUser.user.person.lastName = res.data.lastName;
      this._dataUser.user.person.firstName = res.data.firstName;
      this._dataUser.user.person.address = res.data.address;
      this._dataUser.user.person.telNumber = res.data.telNumber;
      this._password = '';
      this._passwordR = '';
      notifyListeners();

      return res.ok;
    } else {
      return res.ok;
    }
  }

  getSerciesClothe() async {
    final url = Uri.parse('$_urlApi/clothe');
    final req = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + this._dataUser.token,
      },
    );
    final res = servicesModelFromJson(req.body);
    this._dataService = res;
    notifyListeners();
  }
}
