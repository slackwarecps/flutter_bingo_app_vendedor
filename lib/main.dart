import 'dart:developer';

import 'package:bingo_app_vendedor/modelos/Credito.dart';
import 'package:bingo_app_vendedor/modelos/journal.dart';
import 'package:bingo_app_vendedor/services/credito_service.dart';
import 'package:bingo_app_vendedor/services/journal_service.dart';
import 'package:bingo_app_vendedor/services/perfil_service.dart';
import 'package:bingo_app_vendedor/helpers/async_study.dart';
import 'package:bingo_app_vendedor/telas/home_screen.dart';
import 'package:bingo_app_vendedor/telas/jornada_de_credito/credito_coloca_valor.dart';
import 'package:bingo_app_vendedor/telas/jornada_de_credito/credito_conclusao.dart';
import 'package:bingo_app_vendedor/telas/login_screen.dart';
import 'package:bingo_app_vendedor/telas/perfil_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());

  CreditoService creditoService = CreditoService();
  creditoService.getAll();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bingo Vendedor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "login",
      routes: {
        "login": (context) => const LoginScreen(),
        "home": (context) => const HomeScreen(),
        "perfil": (context) => const PerfilScreen(),
        "credito-conclusao": (context) => const CreditoConclusaoScreen()
      },
      onGenerateRoute: (settings) {
        if (settings.name == "creditoConclusao") {
          final Credito credito = settings.arguments as Credito;
          return MaterialPageRoute(builder: (context) {
            return CreditoConclusaoScreen();
          });
        }

        if (settings.name == "credito-coloca-valor") {
          return MaterialPageRoute(builder: (context) {
            return CreditoColocaValorScreen(valorPacote: 12.77);
          });
        }
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
