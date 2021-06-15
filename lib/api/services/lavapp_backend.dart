import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:login/api/models/bill.dart';
import 'package:login/api/models/billdetail.dart';
import 'package:login/api/models/login.dart';

var _urlApi = 'https://lavapp-backend.herokuapp.com/api';

class ServicesApi with ChangeNotifier {
  List<BillItems> billItems = [];
  List<DetailsBills> detailsBills = [];
  bool _loading = true;
  String _email = 'DearPage25';
  String _password = '123456';
  LoginModel _loginModel = new LoginModel();
  String _idBill = '';
  String _idUser = '';
  DetailsBills detailbill = DetailsBills();
  // ServicesApi() {

  // }

  List<DetailsBills> get getdetailBills => detailsBills;

  String get getIdBill => this._idBill;
  set setIdBill(String value) {
    this._idBill = value;
    notifyListeners();
  }

  ///Login
  ///

  bool get getLoading => this._loading;

  String get getEmail => this._email;
  String get getPassword => this._password;
  LoginModel get getLoginModel => this._loginModel;

  set setLoading(bool value) {
    this._loading = value;
    notifyListeners();
  }

  set setEmail(String value) {
    this._email = value;
    notifyListeners();
  }

  set setPassword(String value) {
    this._password = value;
    notifyListeners();
  }

  setLogin() async {
    this._loading = true;
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
      this._loginModel = loginModelFromJson(res);
      this._idUser = this._loginModel.user.idUser;
      this._loading = false;
      return true;
    } else {
      return false;
    }
  }

  ///Bill
  ///
  getBill() async {
    if (this.billItems.length > 0) {
      return this.billItems;
    }

    final url = '$_urlApi/bill/bycustomer/${this._idUser}';

    final req = await http.get(url);
    final res = billModelFromJson(req.body);
    return this.billItems.addAll(res.data);
  }

  getBillDetaill(idBill) async {
    //TODO: HAY QUE LLAMAR TODOS LOS BILL TU SOLO LLAMA UNO
    final url = '$_urlApi/billdetail/bybill/$idBill';
    final req = await http.get(url);
    final res = billDetailModelFromJson(req.body);
    notifyListeners();
    return res.data;
  }

  callDetailData(List<BillItems> items, int index) async {
    if (this.detailsBills.length > 0) {
      return this.detailsBills;
    }
    this.detailsBills.addAll(getBillDetaill(items[index].idBill));
    print(detailsBills[index].idBill);
  }
}
