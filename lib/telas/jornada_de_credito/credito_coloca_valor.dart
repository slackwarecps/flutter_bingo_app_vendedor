import 'dart:ffi';

import 'package:bingo_app_vendedor/modelos/credito.dart';
import 'package:bingo_app_vendedor/modelos/credito_argumentos.dart';
import 'package:bingo_app_vendedor/services/credito_service.dart';
import 'package:bingo_app_vendedor/telas/home_screen.dart';
import 'package:bingo_app_vendedor/telas/jornada_de_credito/credito_conclusao.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreditoColocaValorScreen extends StatefulWidget {
  static const routeName = 'report-financeiro';
  const CreditoColocaValorScreen({Key? key}) : super(key: key);

  @override
  State<CreditoColocaValorScreen> createState() =>
      _CreditoColocaValorScreenState();
}

class _CreditoColocaValorScreenState extends State<CreditoColocaValorScreen> {
  String titulo = 'IDENTIFICA COLOCA VALOR 2';
  final String _codigo = "223344";
  final String _nome = "Tiao do Bar";
  final double _valor = 0;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as CreditoArgumentos;

    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Coloca Valor'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(_nome),
            Text('Codigo: ${args.jogadorId}'),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Text('Valor Selecionado'),
            Text(args.valor.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Voltar')),
                FilledButton.tonal(
                    onPressed: () {
                      //ssssss
                      registraCredito(context);

                      //sss
                    },
                    child: const Text('Adicionar Credito')),
              ],
            ),
          ],
        ));
  }

  registraCredito(BuildContext context) async {
    print('Function to add credit called...');
    CreditoService creditoService = CreditoService();

    SharedPreferences.getInstance().then((preferences) {
      int userId = preferences.getInt('id') ?? 0;
      String? token = preferences.getString('accessToken');
      Credito credito = Credito(
          jogadorId: '123', nome: 'Tiao do Bar', valor: 23.50, userId: userId);

      creditoService.adicionaCredito(token!, credito).then((value) {
        if (value == true) {
          print('Credit added successfully');
          Navigator.pushNamed(context, 'credito-conclusao');
        } else {
          print('Erro ao adicionar credito!!!');
          Navigator.pop(context, DisposeStatus.error);
        }
      });
    });
  }
}

enum DisposeStatus { exit, error, success }
