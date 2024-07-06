import 'package:bingo_app_vendedor/telas/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    loginController.text = 'vendedor@email.com.br';
    passwordController.text = 'senha123';
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Bingo vendedor login'),
        ),
        body: Center(
          child: Container(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Login ',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: loginController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    hintText: 'Digite o login',
                    fillColor: Colors.white70,
                    filled: true,
                  ),
                ),
                Text(
                  'senha',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: passwordController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Digite a senha',
                    fillColor: Colors.white70,
                    filled: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    print('clicou em Login');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contextNew) => HomeScreen(),
                      ),
                    );
                  },
                  child: Text('Entrar'),
                ),
              ],
            ),
          ),
        ));
  }
}
