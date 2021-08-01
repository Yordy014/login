import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  String get datosUsuario {
    return _prefs.getString('datosUsuario') ?? '';
  }

  set datosUsuario(String value) {
    this._prefs.setString('datosUsuario', value);
  }
}
