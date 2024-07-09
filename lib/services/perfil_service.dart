import 'dart:convert';

import 'package:bingo_app_vendedor/modelos/perfil_vendedor.dart';
import 'package:bingo_app_vendedor/services/http_interceptors.dart';
import 'package:bingo_app_vendedor/telas/perfil/perfil_screen.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

class PerfilService {
  static const String url = "http://192.168.1.104:3000/";
  //static const String url = "https://open-bingo.wiremockapi.cloud/";

  static const String resource = "perfil/";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  String getURL() {
    return "$url$resource";
  }

  Future<bool> edita(String id, PerfilVendedor perfilVendedor) async {
    String jsonCredito = json.encode(perfilVendedor.toMap());

    http.Response response = await http.put(
      Uri.parse("${getURL()}$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonCredito,
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  void salvar(PerfilVendedor perfilVendedor) {
    print('uhulll');
  }
}
