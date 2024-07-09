import 'package:bingo_app_vendedor/modelos/Credito.dart';
import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';

class CreditoCard extends StatelessWidget {
  final Credito? credito;

  final Function refreshFunction;
  const CreditoCard({
    Key? key,
    this.credito,
    required this.refreshFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (credito != null) {
      return InkWell(
        onTap: () {
          //TODO: Implementar edição da entrada
        },
        child: Container(
          height: 115,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black87,
            ),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 75,
                    width: 75,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      border: Border(
                          right: BorderSide(color: Colors.black87),
                          bottom: BorderSide(color: Colors.black87)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      credito!.nome,
                      style: const TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 38,
                    width: 75,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.black87),
                      ),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Text('aaaaaaaa'),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'aaaaaaaa',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          callAddJournalScreen(context);
        },
        child: Container(
          height: 115,
          alignment: Alignment.center,
          child: Text(
            "aaaaaaaa",
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  callAddJournalScreen(BuildContext context) {
    // Navigator.pushNamed(
    //   context,
    //   'add-journal',
    //   arguments: Credito(
    //     jogadorId: '123',
    //     nome: 'asdasd',
    //     valor: 34.0
    //   ),
    // ).then((value) {
    //   refreshFunction();

    //   if (value == DisposeStatus.success) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(
    //         content: Text("Registro salvo com sucesso."),
    //       ),
    //     );
    //   } else if (value == DisposeStatus.error) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(
    //         content: Text("Houve uma falha ao registar."),
    //       ),
    //     );
    //   }
    // });
  }
}
