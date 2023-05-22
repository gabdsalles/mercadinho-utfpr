// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:projeto_mercadinho/pages/cadastrar_page.dart';
import 'package:projeto_mercadinho/pages/recuperar_senha_page.dart';
import 'package:provider/provider.dart';

import '../repositories/cadastro_repository.dart';

// ignore: camel_case_types
class Login_Page extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final _ra = TextEditingController();
  final _senha = TextEditingController();

  late CadastroRepository cadastro;

  logar(String ra, String senha, BuildContext context) async {
    if (_form.currentState!.validate()) {
      cadastro.login(ra, senha, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    cadastro = context.watch<CadastroRepository>();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Mercadinho Universitário'),
        ),
        leading: Image.asset('images/abelha.png'),
        backgroundColor: Colors.yellow.shade400,
      ),
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset('images/abelha.png'),
                  width: 200,
                ),
              ],
            ),
          ),
          Form(
            key: _form,
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 300,
                  child: TextFormField(
                    controller: _ra,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20.0),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      labelText: 'ra',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo de RA em branco !';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  height: 100,
                  width: 300,
                  child: TextFormField(
                    controller: _senha,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20.0),
                      filled: true, //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      labelText: 'Senha',
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo de Senha em branco !';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(top: 16),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                  Colors.amber.shade300,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              onPressed: () {
                logar(_ra.text, _senha.text, context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      Colors.yellow.shade400,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cadastrar_Page()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Cadastrar',
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 59),
                margin: EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      Colors.yellow.shade400,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Recuperar_Senha_Page()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Recuperar Senha',
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      backgroundColor: Colors.yellow.shade100,
    );
  }
}
