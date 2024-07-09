import 'dart:math';

import 'package:bingo_app_vendedor/services/auth_service.dart';
import 'package:bingo_app_vendedor/telas/commons/confirmacao_dialogo.dart';
import 'package:flutter/material.dart';

class LoginNovoScreen extends StatelessWidget {
  LoginNovoScreen({Key? key}) : super(key: key);

  //campos controladores
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  //injetar servico de autenticacao
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    _emailController.text = 'ninguem@mail.com';
    _senhaController.text = 'senha123';

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(32),
        decoration:
            BoxDecoration(border: Border.all(width: 8), color: Colors.white),
        child: Form(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Icon(
                    Icons.bookmark,
                    size: 64,
                    color: Colors.brown,
                  ),
                  const Text(
                    "Vendedor App",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text("por Bingo",
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(thickness: 2),
                  ),
                  const Text("Entre ou Registre-se"),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      label: Text("E-mail"),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    controller: _senhaController,
                    decoration: const InputDecoration(label: Text("Senha")),
                    keyboardType: TextInputType.visiblePassword,
                    maxLength: 16,
                    obscureText: true,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        buttonLoginClicked(context);
                      },
                      child: const Text("Continuar")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void buttonLoginClicked(BuildContext context) async {
    String email = _emailController.text;
    String senha = _senhaController.text;

    print("Botão de login clicado $email / $senha");

    try {
      bool result = await authService.login(email: email, senha: senha);
    } on UserNotFindException {
      showConfirmationDialog(context,
              conteudo:
                  "Deseja cria um novo usuario com email e senha inseridos? ")
          .then((value) {
        if (value == true) {
          authService.register(email: email, senha: senha);
        }
      });
      print("Usuário não encontrado");
    }
  }
}
