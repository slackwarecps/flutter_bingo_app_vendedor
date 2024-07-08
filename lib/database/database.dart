import 'dart:math';

import 'package:bingo_app_vendedor/modelos/Credito.dart';
import 'package:bingo_app_vendedor/helpers/phrases.dart';
import 'package:uuid/uuid.dart';

Map<String, Credito> generateRandomDatabase({
  required int maxGap, // Tamanho máximo da janela de tempo
  required int amount, // Entradas geradas
}) {
  Random rng = Random();

  Map<String, Credito> map = {};

  for (int i = 0; i < amount; i++) {
    int timeGap = rng.nextInt(maxGap - 1); // Define uma distância do hoje
    DateTime date = DateTime.now().subtract(
      Duration(days: timeGap),
    ); // Gera um dia

    String id = const Uuid().v1();

    map[id] = Credito(
        jogadorId: const Uuid().v1(), nome: getRandomPhrase(), valor: 0.0);
  }
  return map;
}
