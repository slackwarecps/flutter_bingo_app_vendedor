import 'package:flutter/material.dart';

Future<dynamic> showConfirmationDialog(
  BuildContext context, {
  String title = "Atenção!",
  String conteudo = "Deseja realmente fazer isso?",
  String opcaoAfirmativa = "Confirmar",
}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(conteudo),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text('Cancelar')),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(
                opcaoAfirmativa.toUpperCase(),
                style: TextStyle(
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      });
}
