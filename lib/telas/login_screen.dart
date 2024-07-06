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
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Login tela'),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.yellow),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Login '),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: loginController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Digite o login',
                    fillColor: Colors.white70,
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('senha'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Digite a senha',
                    fillColor: Colors.white70,
                    filled: true,
                  ),
                ),
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
                child: Text('Login'),
              ),
            ],
          ),
        ));
  }
}
