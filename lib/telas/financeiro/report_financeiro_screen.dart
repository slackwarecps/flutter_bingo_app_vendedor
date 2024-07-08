import 'package:bingo_app_vendedor/telas/financeiro/financeiro_creditos.dart';
import 'package:flutter/material.dart';

class ReportFinanceiroScreen extends StatefulWidget {
  const ReportFinanceiroScreen({Key? key}) : super(key: key);

  @override
  State<ReportFinanceiroScreen> createState() => _ReportFinanceiroScreenState();
}

class _ReportFinanceiroScreenState extends State<ReportFinanceiroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Report Financeiro tela'),
          actions: [],
        ),
        body: Column(
          children: [
            Text('Reporte Financeiro tela !!!'),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contextNew) => FinanceiroCreditosScreen(),
                    ),
                  );
                },
                child: Text('Pesquisar'))
          ],
        ));
  }
}
