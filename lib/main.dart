import 'dart:developer';

import 'package:bingo_app_vendedor/modelos/Credito.dart';
import 'package:bingo_app_vendedor/modelos/credito_argumentos.dart';
import 'package:bingo_app_vendedor/modelos/journal.dart';
import 'package:bingo_app_vendedor/modelos/perfil_vendedor.dart';
import 'package:bingo_app_vendedor/modelos/screen_arguments.dart';
import 'package:bingo_app_vendedor/services/credito_service.dart';
import 'package:bingo_app_vendedor/services/journal_service.dart';
import 'package:bingo_app_vendedor/services/perfil_service.dart';
import 'package:bingo_app_vendedor/helpers/async_study.dart';
import 'package:bingo_app_vendedor/telas/financeiro/report_financeiro.dart';
import 'package:bingo_app_vendedor/telas/home_screen.dart';
import 'package:bingo_app_vendedor/telas/jornada_de_credito/credito_coloca_valor.dart';
import 'package:bingo_app_vendedor/telas/jornada_de_credito/credito_conclusao.dart';
import 'package:bingo_app_vendedor/telas/login_screen.dart';
import 'package:bingo_app_vendedor/telas/login_screen/login_novo_screen.dart';
import 'package:bingo_app_vendedor/telas/perfil/perfil_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> verificaToken() async {
  return SharedPreferences.getInstance().then((prefs) {
    String? token = prefs.getString('token');
    if (token != null) {
      return true;
    }
    return false;
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool estaLogado = await verificaToken();
  runApp(MyApp(
    estaLogado: estaLogado,
  ));

  CreditoService creditoService = CreditoService();
  //creditoService.getAll();
}

class MyApp extends StatelessWidget {
  final bool estaLogado;

  const MyApp({super.key, required this.estaLogado});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bingo Vendedor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: (estaLogado) ? "home" : "login-novo",
      routes: {
        "login": (context) => const LoginScreen(),
        "login-novo": (context) => LoginNovoScreen(),
        "home": (context) => const HomeScreen(),
        ReportFinanceiroScreen.routeName: (context) =>
            const ReportFinanceiroScreen(),
        "credito-conclusao": (context) => const CreditoConclusaoScreen()
      },
      onGenerateRoute: (settings) {
        if (settings.name == "perfil") {
          Map<String, dynamic> meuMapa =
              settings.arguments as Map<String, dynamic>;
          final PerfilVendedor perfilVendedor =
              meuMapa['perfilVendedor'] as PerfilVendedor;
          final bool isEdit = meuMapa['isEdit'];

          return MaterialPageRoute(builder: (context) {
            return PerfilScreen(
              perfilVendedor: perfilVendedor,
              isEdit: isEdit,
            );
          });
        }

        if (settings.name == "creditoConclusao") {
          final Credito credito = settings.arguments as Credito;
          return MaterialPageRoute(builder: (context) {
            return CreditoConclusaoScreen();
          });
        }

        // Coloca Credito :: credito-coloca-valor
        // if (settings.name == CreditoColocaValorScreen.routeName) {
        //   final args = settings.arguments as CreditoArgumentos;
        //   return MaterialPageRoute(
        //     builder: (context) {
        //       return CreditoColocaValorScreen(
        //           //valorPacote: args.valorPacote,
        //           );
        //     },
        //   );
        // }

        // If you push the PassArguments route
        if (settings.name == ReportFinanceiroScreen.routeName) {
          // Cast the arguments to the correct
          // type: ScreenArguments.
          final args = settings.arguments as ReportFinanceiroParametros;

          // Then, extract the required data from
          // the arguments and pass the data to the
          // correct screen.
          return MaterialPageRoute(
            builder: (context) {
              return ReportFinanceiroScreen(
                  //message: 'teste',
                  //title: args.title,
                  //message: args.message,
                  );
            },
          );
        }
        assert(false, 'Precisar ser Implementado ${settings.name}');
        return null;
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
