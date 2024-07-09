import 'dart:convert';
import 'dart:io';

import 'package:bingo_app_vendedor/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  //TODO: Implementar a lógica de login e registro
  static const String url = "http://192.168.1.104:3000/";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  Future<bool> login({required String email, required String senha}) async {
    http.Response response = await client.post(
      Uri.parse("${url}login"),
      body: {"email": email, "password": senha},
    );

    if (response.statusCode != 200) {
      String conteudo = json.decode(response.body);
      switch (conteudo) {
        case 'Cannot find user':
          throw UserNotFindException();
      }

      throw const HttpException("Erro ao fazer login");
    }

    // salva info do usuario
    salvaInfoUsuario(response.body);

    return true;
  }

  register({required String email, required String senha}) async {
    http.Response response = await client.post(
      Uri.parse("${url}register"),
      body: {"email": email, "password": senha},
    );
    if (response.statusCode != 201) {
      throw const HttpException("Erro ao fazer login");
    }

    // salva info do usuario
    salvaInfoUsuario(response.body);
  }

  salvaInfoUsuario(String body) async {
    Map<String, dynamic> map = jsonDecode(body);
    print("*************");
    print(map);
    String token = map["accessToken"];

    String email = map["user"]["email"];
    int id = map["user"]["id"];
    print(" $token / $email / $id");
    print("*************");

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("accessToken", token);
    await prefs.setString("email", email);
    await prefs.setInt("id", id);

    final String? accessToken = prefs.getString('accessToken');

    print("Token salvo: $accessToken");
  }
}

class UserNotFindException implements Exception {
  final String message = "Usuário não encontrado";
}
