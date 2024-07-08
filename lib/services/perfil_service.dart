import 'package:bingo_app_vendedor/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

class PerfilService {
  static const String url = "http://localhost:3001/";

  static const String resource = "perfil/";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  String getURL() {
    return "$url$resource";
  }

  //TODO: Substituir getURL por getURI
  void registerOld(String content) {
    http.post(Uri.parse(getURL()), body: {'content': content});
  }

  void register(String content) {
    client.post(Uri.parse(getURL()), body: {'content': content});
  }

  void getOld() async {
    http.Response response = await http.get(Uri.parse(getURL()));
    print(response.body);
  }

  Future<String> get() async {
    http.Response response = await client.get(Uri.parse(getURL()));
    print(response.body);
    return response.body;
  }
}
