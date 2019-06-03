import 'dart:convert';

import 'package:form_validation/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

class UsuarioProvider {
  final String _firebaseToken = 'AIzaSyDeNfT7iOomeZID9anm5riQNUWA3BEtvhE';
  final _prefs = PreferenciasUsuario();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=$_firebaseToken',
        body: json.encode(authData));

    Map<String, dynamic> decodedResponse = json.decode(resp.body);
    print(decodedResponse);

    if (decodedResponse.containsKey('idToken')) {
      _prefs.token = decodedResponse['idToken'];
      return {'ok': true, 'token': decodedResponse['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodedResponse['error']['message']};
    }
  }

  Future<Map<String, dynamic>> nuevoUsuario(
      String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=$_firebaseToken',
        body: json.encode(authData));

    Map<String, dynamic> decodedResponse = json.decode(resp.body);

    if (decodedResponse.containsKey('idToken')) {
      _prefs.token = decodedResponse['idToken'];
      return {'ok': true, 'token': decodedResponse['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodedResponse['error']['message']};
    }
  }
}
