import 'package:bingo_app_vendedor/modelos/Credito.dart';
import 'package:bingo_app_vendedor/services/credito_service.dart';
import 'package:flutter/material.dart';
import 'package:bingo_app_vendedor/database/database.dart';

class FinanceiroCreditosScreen extends StatefulWidget {
  const FinanceiroCreditosScreen({Key? key}) : super(key: key);

  @override
  State<FinanceiroCreditosScreen> createState() =>
      _FinanceiroCreditosScreenState();
}

class _FinanceiroCreditosScreenState extends State<FinanceiroCreditosScreen> {
  CreditoService creditoService = CreditoService();

  // A base de dados mostrada na lista
  Map<String, Credito> database = {};

  @override
  void initState() {
    refresh();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        body: Text('Reporte Financeiro tela !!!'));
  }

  void refresh() async {
    List<Credito> listaCredito = await creditoService.getAll();
    setState(() {
      database = {};
      for (Credito credito in listaCredito) {
        database[credito.jogadorId] = credito;
      }
    });

    print('refresh');
  }
}
