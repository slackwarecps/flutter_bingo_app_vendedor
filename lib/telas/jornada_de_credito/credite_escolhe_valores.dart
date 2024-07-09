import 'package:bingo_app_vendedor/modelos/credito_argumentos.dart';
import 'package:bingo_app_vendedor/telas/home_screen.dart';
import 'package:bingo_app_vendedor/telas/jornada_de_credito/credito_coloca_valor.dart';
import 'package:bingo_app_vendedor/telas/jornada_de_credito/credito_identifica_jogador.dart';
import 'package:flutter/material.dart';

class CreditoEscolheValorScreen extends StatefulWidget {
  const CreditoEscolheValorScreen({Key? key}) : super(key: key);

  @override
  State<CreditoEscolheValorScreen> createState() =>
      _CreditoEscolheValorScreenState();
}

class _CreditoEscolheValorScreenState extends State<CreditoEscolheValorScreen> {
  String titulo = 'ESCOLHE VALOR';
  double valorEscolhido = 0.0;

  @override
  void initState() {
    super.initState();
    valorEscolhido = 0.00; // Define o valor inicial aqui
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('*** ESCOLHE VALOR ***'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('VALORES'),
            Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        valorEscolhido = 1.00;
                      });
                    },
                    child: Text('1.00')),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        valorEscolhido = 10.00;
                      });
                    },
                    child: Text('10.00')),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        valorEscolhido = 20.00;
                      });
                    },
                    child: Text('20.00')),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        valorEscolhido = 30.00;
                      });
                    },
                    child: Text('30.00')),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        valorEscolhido = 50.00;
                      });
                    },
                    child: Text('50.00')),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        valorEscolhido = 100.00;
                      });
                    },
                    child: Text('100.00')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Valor Selecionado: $valorEscolhido'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilledButton.tonal(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contextNew) =>
                              CreditoIdentificaClienteScreen(),
                        ),
                      );
                    },
                    child: const Text('Voltar')),
                FilledButton.tonal(
                    onPressed: () {
                      onButtonContinuaClicked(context);
                    },
                    child: const Text('CONTINUA >>')),
              ],
            ),
          ],
        ));
  }

  void onButtonContinuaClicked(BuildContext context) {
    print('clicou no Botao Continua!');

    if (valorEscolhido == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Não é possível continuar sem selecionar um valor.'),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CreditoColocaValorScreen(),
          settings: RouteSettings(
            arguments: CreditoArgumentos('999', valorEscolhido),
          ),
        ),
      );
      // Navigator.pushNamed(
      //   context,
      //   'credito-coloca-valor',
      //   arguments: CreditoArgumentos('999', valorEscolhido),
      // );
    }
    // Navigator.pushNamed(context, 'credito-coloca-valor');
  }
}
