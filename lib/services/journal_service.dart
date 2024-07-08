import 'dart:convert';

import 'package:bingo_app_vendedor/modelos/journal.dart';
import 'package:bingo_app_vendedor/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';

class JournalService {
  static const String url = "http://192.168.1.104:3000/";
  static const String resource = "journals/";

  http.Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
  );

  String getURL() {
    return "$url$resource";
  }

  //TODO: Substituir getURL por getURI
  Future<bool> register(Journal journal) async {
    String jsonJournal = json.encode(journal.toMap());

    http.Response response = await client.post(Uri.parse(getURL()),
        headers: {'Content-type': 'application/json'}, body: jsonJournal);
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  void get() async {
    http.Response response = await client.get(Uri.parse(getURL()));
  }
}
