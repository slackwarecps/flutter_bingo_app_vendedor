import 'package:bingo_app_vendedor/modelos/Credito.dart';
import 'package:bingo_app_vendedor/modelos/screen_arguments.dart';
import 'package:bingo_app_vendedor/services/credito_service.dart';
import 'package:bingo_app_vendedor/telas/commons/confirmacao_dialogo.dart';
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
  List<Credito> listaDeCredito = [];

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
        body: gerarListaDeLinhas(database));
  }

  ListView gerarListaDeLinhas(
    Map<String, Credito> database,
  ) {
    return ListView.builder(
      itemCount: listaDeCredito.length,
      itemBuilder: (context, index) {
        final credito = listaDeCredito[index];
        return Column(
          children: [
            Container(
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.monetization_on),
                  title: Text(
                      'jogadorId: ${credito.jogadorId} \nnome: ${credito.nome}'),
                  subtitle: Text(credito.valor.toString()),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  buttonRemoveCredito();
                },
                icon: Icon(Icons.delete)),
          ],
        );
      },
    );
  }

  void refresh() async {
    List<Credito> listaCredito = await creditoService.getAll();

    setState(() {
      database = {};
      for (Credito credito in listaCredito) {
        database[credito.jogadorId] = credito;
        listaDeCredito.add(credito);
      }

      if (_listScrollController.hasClients) {
        final double position = _listScrollController.position.maxScrollExtent;
        _listScrollController.jumpTo(position);
      }
    });
  }

  void buttonRemoveCredito() {
    if (1 == 1) {
      showConfirmationDialog(context,
              conteudo: "Deseja realmente remover o credito?",
              opcaoAfirmativa: "Remover")
          .then((value) {
        if (value != null) {
          if (value == true) {
            print('Removendo credito');

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Credito removido com sucesso'),
              ),
            );
            //Atualiza a lista
            refresh();
          }
        }
      });
    }
    ;
  }
}
