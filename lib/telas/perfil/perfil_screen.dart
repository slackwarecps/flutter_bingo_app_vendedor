import 'package:bingo_app_vendedor/modelos/perfil_vendedor.dart';
import 'package:bingo_app_vendedor/services/perfil_service.dart';
import 'package:flutter/material.dart';

class PerfilScreen extends StatefulWidget {
  final PerfilVendedor perfilVendedor;
  final bool isEdit;
  const PerfilScreen(
      {Key? key, required this.perfilVendedor, required this.isEdit})
      : super(key: key);

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  PerfilService perfilService = PerfilService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Perfil do Vendedor tela'),
        ),
        body: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Telefone'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Endereço'),
              ),
              ElevatedButton(
                onPressed: () {
                  buttonSalvarClicked();
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ));
  }

  buttonSalvarClicked() {
    print('widget.isEdit : ${widget.isEdit}');
    if (widget.isEdit == true) {
      perfilService.edita(widget.perfilVendedor.id, widget.perfilVendedor);
    } else {
      perfilService.salvar(widget.perfilVendedor);
    }

    print('Salvar perfil');
  }
}
