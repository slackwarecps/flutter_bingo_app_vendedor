import 'package:bingo_app_vendedor/modelos/Credito.dart';
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
            Text('Tatiana Vercelino Favoretti'),
            Text('Codigo: 000171717'),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Text('Valor Selecionado'),
            Text('50,00'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilledButton.tonal(
                    onPressed: () {
                      //ssssss
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (contextNew) => CreditoConclusaoScreen(),
                      //   ),
                      // );

                      Credito creditos = Credito(
                          jogadorId: "000171717",
                          nome: "Tatiana Sapao",
                          valor: 50.00,
                          dataHora: DateTime.now(),
                          idTransacao: "qwe65qwe65qweq6w5eq6e");
                      Navigator.pushNamed(context, "creditoConclusao",
                          arguments: creditos);

                      //sss
                    },
                    child: const Text('Confirma')),
              ],
            ),
          ],
        ));
  }
}
