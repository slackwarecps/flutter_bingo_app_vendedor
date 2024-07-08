import 'package:bingo_app_vendedor/telas/jornada_de_credito/credito_identifica_jogador.dart';
import 'package:bingo_app_vendedor/telas/jornada_de_credito/credito_screen.dart';
import 'package:bingo_app_vendedor/telas/login_screen.dart';
import 'package:bingo_app_vendedor/telas/perfil_screen.dart';
import 'package:bingo_app_vendedor/telas/financeiro/report_financeiro_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//Gestor de Estados da Tela Home
class _HomeScreenState extends State<HomeScreen> {
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
          leading: Container(),
          title: Text('Bingo Vendedor - Home'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    print('clicou no Adicionar Credito!');

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contextNew) =>
                            CreditoIdentificaClienteScreen(),
                      ),
                    );
                  },
                  child: Text('Adicionar Credito'),
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    print('clicou no perfil!');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contextNew) => PerfilScreen(),
                      ),
                    );
                  },
                  child: Text('perfil'),
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    print('Report Financeiro');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contextNew) => ReportFinanceiroScreen(),
                      ),
                    );
                  },
                  child: Text('Report Financeiro'),
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    print('clicou em Sair');
                    onButtonSairClicked(context);
                  },
                  child: Text('Sair'),
                ),
              ),
            ],
          ),
        ));
  }

  void onButtonSairClicked(BuildContext context) {
    print('home:: clicou em Sair');

    Navigator.of(context).pushReplacementNamed('login');
  }
}
