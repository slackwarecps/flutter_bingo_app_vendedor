import 'package:uuid/uuid.dart';

class PerfilVendedor {
  String id;
  String nome;
  String endereco;
  String contato;
  String celular;
  String status;
  String createdAt;

  PerfilVendedor({
    required this.id,
    required this.nome,
    this.celular = '',
    this.contato = '',
    this.createdAt = '',
    this.endereco = '',
    this.status = '',
  });

  PerfilVendedor.empty()
      : id = "20041979",
        nome = "",
        celular = '',
        contato = '',
        createdAt = '',
        endereco = '',
        status = '';

  PerfilVendedor.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        nome = map["nome"],
        celular = map["celular"],
        contato = map["contato"],
        createdAt = map["createdAt"],
        endereco = map["endereco"],
        status = map["status"];

  String toString() {
    return "PerfilVendedor(id: $id, nome: $nome, celular: $celular, contato: $contato, createdAt: $createdAt, endereco: $endereco, status: $status)";
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "celular": celular,
      "contato": contato,
      "createdAt": createdAt,
      "endereco": endereco,
      "status": status
    };
  }
}
