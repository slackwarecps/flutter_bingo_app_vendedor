import 'package:bingo_app_vendedor/componentes/home_screen_list.dart';
import 'package:bingo_app_vendedor/modelos/Credito.dart';
import 'package:bingo_app_vendedor/modelos/screen_arguments.dart';
import 'package:bingo_app_vendedor/services/credito_service.dart';
import 'package:flutter/material.dart';
import 'package:bingo_app_vendedor/database/database.dart';

class ReportFinanceiroScreen extends StatefulWidget {
  const ReportFinanceiroScreen({Key? key}) : super(key: key);

  static const routeName = 'report-financeiro';
  static String message = 'Hello';

  @override
  State<ReportFinanceiroScreen> createState() => _ReportFinanceiroScreenState();
}

class _ReportFinanceiroScreenState extends State<ReportFinanceiroScreen> {
  CreditoService creditoService = CreditoService();
  // Tamanho da lista
  int windowPage = 5;

  // A base de dados mostrada na lista
  Map<String, Credito> database = {};

  List<Widget> listaDeLinhas = [];
  final ScrollController _listScrollController = ScrollController();
  final CreditoService _creditoService = CreditoService();

  @override
  void initState() {
    refresh();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments
        as ReportFinanceiroParametros;

    return Scaffold(
      appBar: AppBar(
        title: Text('Financeiro Créditos tela'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              refresh();
            },
          )
        ],
      ),
      body: ListView(
        controller: _listScrollController,
        children: generateListJournalCards(
          windowPage: windowPage,
          database: database,
          refreshFunction: refresh,
        ),
      ),
    );
  }

  void refresh() async {
    List<Credito> listaCredito = await creditoService.getAll();

    setState(() {
      database = {};
      for (Credito credito in listaCredito) {
        database[credito.jogadorId] = credito;
      }

      if (_listScrollController.hasClients) {
        final double position = _listScrollController.position.maxScrollExtent;
        _listScrollController.jumpTo(position);
      }
    });
  }
}
