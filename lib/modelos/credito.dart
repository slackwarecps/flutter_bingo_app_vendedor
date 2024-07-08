class Credito {
  String jogadorId;
  String nome;
  double valor;
  DateTime dataHora;
  String idTransacao;

  Credito({
    required this.jogadorId,
    required this.nome,
    required this.valor,
    required this.dataHora,
    required this.idTransacao,
  });

  factory Credito.fromMap(Map<String, dynamic> map) {
    return Credito(
      jogadorId: map["jogadorId"],
      nome: map["nome"],
      valor: map["valor"],
      dataHora: map["dataHora"],
      idTransacao: map["idTransacao"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "jogadorId": jogadorId,
      "nome": nome,
      "valor": valor,
      "dataHora": dataHora,
      "idTransacao": idTransacao,
    };
  }
}
