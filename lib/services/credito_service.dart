import 'dart:convert';

import 'package:bingo_app_vendedor/modelos/Credito.dart';
import 'package:bingo_app_vendedor/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

class CreditoService {
  static const String url = "http://192.168.1.104:3000/";

  static const String resource = "credito/";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  String getURL() {
    return "$url$resource";
  }

  Future<bool> adicionaCredito(Credito credito) async {
    String jsonCredito = json.encode(credito.toMap());

    http.Response response = await http.post(
      Uri.parse(getURL()),
      headers: {"Content-Type": "application/json"},
      body: jsonCredito,
    );
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<List<Credito>> getAll() async {
    http.Response response = await client.get(Uri.parse(getURL()));

    if (response.statusCode != 200) {
      throw Exception("Erro ao buscar creditos");
    }

    List<Credito> lidaDeCreditos = [];

    json.decode(response.body).forEach((credito) {
      lidaDeCreditos.add(Credito.fromMap(credito));
    });

    print(response.body);

    return lidaDeCreditos;
  }
}
