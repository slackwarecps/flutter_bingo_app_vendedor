import 'package:uuid/uuid.dart';

class Credito {
  String jogadorId;
  String nome;
  double valor;

  Credito({
    required this.jogadorId,
    required this.nome,
    required this.valor,
  });

  Credito.empty()
      : jogadorId = Uuid().v1(),
        nome = "",
        valor = 0.0;

  factory Credito.fromMap(Map<String, dynamic> map) {
    return Credito(
      jogadorId: map["jogadorId"],
      nome: map["nome"],
      valor: map["valor"],
    );
  }

  String toString() {
    return "Credito(jogadorId: $jogadorId, nome: $nome, valor: $valor)";
  }

  Map<String, dynamic> toMap() {
    return {
      "jogadorId": jogadorId,
      "nome": nome,
      "valor": valor,
    };
  }
}
