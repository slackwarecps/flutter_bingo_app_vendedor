import 'dart:ffi';

import 'package:bingo_app_vendedor/modelos/Credito.dart';
import 'package:bingo_app_vendedor/services/credito_service.dart';
import 'package:bingo_app_vendedor/telas/home_screen.dart';
import 'package:bingo_app_vendedor/telas/jornada_de_credito/credito_conclusao.dart';
import 'package:flutter/material.dart';

class CreditoColocaValorScreen extends StatefulWidget {
  const CreditoColocaValorScreen({Key? key}) : super(key: key);

  @override
  State<CreditoColocaValorScreen> createState() =>
      _CreditoColocaValorScreenState();
}

class _CreditoColocaValorScreenState extends State<CreditoColocaValorScreen> {
  String titulo = 'IDENTIFICA COLOCA VALOR 2';
  final String _codigo = "223344";
  final String _nome = "Tiao do Bar";
  final double _valor = 23.50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Adiciona Valor'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(_nome),
            Text('Codigo: $_codigo'),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Text('Valor Selecionado'),
            Text(_valor.toString()),
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
    print('funcao de colocar credito chamada...');
    CreditoService creditoService = CreditoService();

    Credito credito =
        Credito(jogadorId: '123', nome: 'Tiao do Bar', valor: 23.50);

    creditoService.adicionaCredito(credito).then((value) {
      Navigator.pushNamed(context, 'credito-conclusao');
      print('Deu certo fechando tela');
    });
  }
}
