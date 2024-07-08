import 'package:bingo_app_vendedor/telas/home_screen.dart';
import 'package:bingo_app_vendedor/telas/jornada_de_credito/credito_identifica_cliente.dart';
import 'package:flutter/material.dart';

class CreditoConclusaoScreen extends StatefulWidget {
  const CreditoConclusaoScreen({Key? key}) : super(key: key);

  @override
  State<CreditoConclusaoScreen> createState() => _CreditoConclusaoScreenState();
}

class _CreditoConclusaoScreenState extends State<CreditoConclusaoScreen> {
  String titulo = 'CREDITO CONCLUSÃO';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Credito conclusao'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('JogadorId: 000171717'),
            Text('Tatiana Vercelino Favoretti'),
            Text('RS 50,00'),
            SizedBox(height: 20),
            Text('07/07/2024 08:36:22'),
            Text('Id transacao: qwe65qwe65qweq6w5eq6e'),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Icon(Icons.card_travel, color: Colors.green, size: 100),
            Text('Valor Inserido com sucesso'),
            SizedBox(height: 20),
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
                    child: const Text('Adicionar outro valor ')),
                FilledButton.tonal(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contextNew) => HomeScreen(),
                        ),
                      );
                    },
                    child: const Text('OK')),
              ],
            ),
          ],
        ));

    callAddSolicitacaoCredito() {
      print('chamou...');
    }
  }
}
