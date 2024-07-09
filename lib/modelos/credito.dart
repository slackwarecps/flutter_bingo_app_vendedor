import 'package:uuid/uuid.dart';

class Credito {
  String jogadorId;
  String nome;
  double valor;
  int userId; // Nova propriedade adicionada

  Credito({
    required this.jogadorId,
    required this.nome,
    required this.valor,
    required this.userId, // Adicione a nova propriedade ao construtor
  });

  Credito.empty()
      : jogadorId = Uuid().v1(),
        nome = "",
        valor = 0.0,
        userId = 0; // Defina um valor padrão para a nova propriedade

  Credito.fromMap(Map<String, dynamic> map)
      : jogadorId = map["jogadorId"],
        nome = map["nome"],
        valor = map["valor"].toDouble(),
        userId = map[
            "userId"]; // Adicione a nova propriedade ao construtor fromMap e converta para int

  String toString() {
    return "Credito(jogadorId: $jogadorId, nome: $nome, valor: $valor, userId: $userId)"; // Atualize o método toString para incluir a nova propriedade
  }

  Map<String, dynamic> toMap() {
    return {
      "jogadorId": jogadorId,
      "nome": nome,
      "valor": valor,
      "userId": userId, // Adicione a nova propriedade ao método toMap
    };
  }
}
