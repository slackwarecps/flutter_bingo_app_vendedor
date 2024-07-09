import 'package:bingo_app_vendedor/modelos/screen_arguments.dart';
import 'package:bingo_app_vendedor/telas/financeiro/report_financeiro.dart';
import 'package:flutter/material.dart';

class ReportFinanceiroFiltroScreen extends StatefulWidget {
  const ReportFinanceiroFiltroScreen({Key? key}) : super(key: key);

  @override
  State<ReportFinanceiroFiltroScreen> createState() =>
      _ReportFinanceiroFiltroScreenState();
}

class _ReportFinanceiroFiltroScreenState
    extends State<ReportFinanceiroFiltroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Report Financeiro Filtro'),
          actions: [],
        ),
        body: Center(
          child: Column(
            children: [
              Text('Reporte Financeiro tela !!!'),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        ButtonVoltarClick();
                      },
                      child: Text('Voltar')),
                  ElevatedButton(
                      onPressed: () {
                        onButtonClick();
                      },
                      child: Text('Pesquisar')),
                ],
              )
            ],
          ),
        ));
  }

  void ButtonVoltarClick() {
    Navigator.pushNamed(context, 'home');
  }

  void onButtonClick() {
    // When the user taps the button,
    // navigate to a named route and
    // provide the arguments as an optional
    // parameter.
    Navigator.pushNamed(
      context,
      ReportFinanceiroScreen.routeName,
      arguments: ReportFinanceiroParametros(
        'Titulo Lindo',
        'Agora vai jose!!!',
      ),
    );
  }
}
