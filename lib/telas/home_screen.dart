import 'package:bingo_app_vendedor/modelos/perfil_vendedor.dart';
import 'package:bingo_app_vendedor/modelos/screen_arguments.dart';
import 'package:bingo_app_vendedor/telas/jornada_de_credito/credito_identifica_jogador.dart';
import 'package:bingo_app_vendedor/telas/jornada_de_credito/credito_screen.dart';
import 'package:bingo_app_vendedor/telas/login_screen.dart';
import 'package:bingo_app_vendedor/telas/perfil/perfil_screen.dart';
import 'package:bingo_app_vendedor/telas/financeiro/report_financeiro_filtro_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                      builder: (contextNew) => CreditoIdentificaClienteScreen(),
                    ),
                  );
                },
                child: Text('Adicionar Credito'),
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  buttonChamaPerfilClicked(context);
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
                      builder: (contextNew) => ReportFinanceiroFiltroScreen(),
                    ),
                  );
                },
                child: Text('Report Financeiro'),
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  onButtonTesteClicked(context);
                },
                child: Text('Teste'),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Sair"),
              onTap: () {
                logout();
              },
            )
          ],
        ),
      ),
    );
  }

  void onButtonSairClicked(BuildContext context) {
    print('home:: clicou em Sair');

    Navigator.of(context).pushReplacementNamed('login');
  }

  void onButtonTesteClicked(BuildContext context) {
    print('home:: clicou em Teste');
    Navigator.of(context).pushReplacementNamed('report-financeiro',
        arguments: ReportFinanceiroParametros(
          'Titulo Lindo',
          'Agora vai jose!!!',
        ));
  }

  void buttonChamaPerfilClicked(BuildContext context) {
    print('home:: clicou em Perfil');
    Map<String, dynamic> mapa2 = {}; //inicilizando vazio teste

    Map<String, dynamic> meuMapa = {
      'perfilVendedor': PerfilVendedor.empty(),
      'isEdit': true
    };

    Navigator.pushNamed(context, 'perfil', arguments: meuMapa);
  }

  void logout() {
    print('logout');

    SharedPreferences.getInstance().then((prefs) {
      prefs.clear();
      print('prefs apagado!!');
      Navigator.of(context).pushReplacementNamed('login');
    });
  }
}
