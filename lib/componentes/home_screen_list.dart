import 'package:bingo_app_vendedor/modelos/Credito.dart';

import 'journal_card.dart';

List<JournalCard> generateListJournalCards(
    {required int windowPage,
    required Map<String, Credito> database,
    required Function refreshFunction}) {
  // Cria uma lista de Cards vazios
  List<JournalCard> list = List.generate(
    windowPage + 1,
    (index) => JournalCard(
      refreshFunction: refreshFunction,
    ),
  );

  //Preenche os espaços que possuem entradas no banco
  // database.forEach(
  //   (key, value) {
  //     list.add(JournalCard(
  //       credito: value,
  //       refreshFunction: refreshFunction,
  //     ));
  //   },
  // );

  return list;
}
