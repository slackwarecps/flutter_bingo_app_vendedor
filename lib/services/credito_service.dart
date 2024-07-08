import 'dart:convert';

import 'package:bingo_app_vendedor/modelos/Credito.dart';
import 'package:bingo_app_vendedor/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

class CreditoService {
  static const String urlc = "https://open-bingo.wiremockapi.cloud/";
  static const String url = "http://localhost:3001/";

  static const String resource = "jogador/credito-adiciona/";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  String getURL() {
    return "$url$resource";
  }

  Future<bool> adicionaCredito(Credito credito) async {
    String jsonCredito = json.encode(credito.toMap());
    http.Response response = await http.post(
      Uri.parse(getURL()),
      body: jsonCredito,
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 20) {
      return true;
    }
    return false;
  }

  Future<String> buscaCreditos() async {
    http.Response response = await client.get(Uri.parse(getURL()));
    print(response.body);
    return response.body;
  }
}
