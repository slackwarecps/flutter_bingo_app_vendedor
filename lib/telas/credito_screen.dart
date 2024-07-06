import 'package:flutter/material.dart';

class CreditoScreen extends StatefulWidget {
  const CreditoScreen({Key? key}) : super(key: key);

  @override
  State<CreditoScreen> createState() => _CreditoScreenState();
}

class _CreditoScreenState extends State<CreditoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Adiciona Credito tela'),
        ),
        body: Text('Adiciona Credito  tela !!!'));
  }
}
