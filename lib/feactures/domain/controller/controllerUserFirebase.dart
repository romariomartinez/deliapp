import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/service/peticionesUserFirebase.dart';

class ControlUserAuth extends GetxController {
  final _response = Rxn();
  final _mensaje = "".obs;
  final Rxn<UserCredential> _usuario = Rxn<UserCredential>();

  get user => null;

  Future<void> crearUser(String email, String pass) async {
    _response.value = await Peticioneslogin.crearRegistroEmail(email, pass);
    print(_response.value);
    await controlUser(_response.value);
  }

  Future<void> ingresarUser(String email, String pass) async {
    _response.value = await Peticioneslogin.ingresarEmail(email, pass);
    print(_response.value);
    await controlUser(_response.value);
  }

  Future<void> validarEmail(String email, String pass) async {
    _response.value = await Peticioneslogin.ingresarEmail(email, pass);
    print(_response.value);
    await controlUser(_response.value);
  }

  Future<void> controlUser(dynamic respuesta) async {
    if (respuesta == null) {
      _mensaje.value = "No Se Completo la consulta";
    } else if (respuesta == "1" || respuesta == "2") {
      _mensaje.value = "No Se Completo la Consulta";
    } else {
      _mensaje.value = "Registro Exitoso";
      _usuario.value = respuesta;
    }
  }

  dynamic get estadoUser => _response.value;
  String get mensajesUser => _mensaje.value;
  UserCredential? get userValido => _usuario.value;
}
