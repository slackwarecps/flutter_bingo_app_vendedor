import 'package:bingo_app_vendedor/telas/home_screen.dart';
import 'package:bingo_app_vendedor/telas/jornada_de_credito/credito_coloca_valor.dart';
import 'package:flutter/material.dart';

class CreditoIdentificaClienteScreen extends StatefulWidget {
  const CreditoIdentificaClienteScreen({Key? key}) : super(key: key);

  @override
  State<CreditoIdentificaClienteScreen> createState() =>
      _CreditoIdentificaJogadorScreenState();
}

class _CreditoIdentificaJogadorScreenState
    extends State<CreditoIdentificaClienteScreen> {
  TextEditingController jogadorIdController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    jogadorIdController.text = '000171717';
    jogadorIdController.text = '000171717';

    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('IDENTIFICA JOGADOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: jogadorIdController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: 'E-mail',
                hintText: 'Digite o login',
                fillColor: Colors.white70,
                filled: true,
              ),
            ),
            TextFormField(
              controller: telefoneController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: 'Telefone',
                hintText: 'exemplo: 11999999999',
                fillColor: Colors.white70,
                filled: true,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilledButton.tonal(onPressed: () {}, child: const Text('NFC')),
                FilledButton.tonal(
                    onPressed: () {}, child: const Text('QR CODE')),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilledButton.tonal(
                    onPressed: () {
                      Navigator.pushNamed(context, 'home');
                    },
                    child: const Text('Voltar')),
                FilledButton.tonal(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contextNew) => CreditoColocaValorScreen(),
                        ),
                      );
                    },
                    child: const Text('Proximo')),
              ],
            ),
          ],
        ));
  }
}
