import 'dart:convert';
import 'dart:io';

import 'package:bingo_app_vendedor/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

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
    return true;
  }

  register({required String email, required String senha}) async {
    http.Response response = await client.post(
      Uri.parse("${url}register"),
      body: {"email": email, "password": senha},
    );
  }
}

class UserNotFindException implements Exception {
  final String message = "Usuário não encontrado";
}
