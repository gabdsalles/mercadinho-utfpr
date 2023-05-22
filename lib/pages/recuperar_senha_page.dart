// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repositories/cadastro_repository.dart';

// ignore: camel_case_types
class Recuperar_Senha_Page extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _ra = TextEditingController();

  late CadastroRepository cadastro;
  recuperar(String email, String ra, BuildContext context) {
    if (_form.currentState!.validate()) {
      cadastro.recuperarSenha(email, ra, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    cadastro = context.watch<CadastroRepository>();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Recuperar Senha'),
        ),
        backgroundColor: Colors.yellow,
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
                  child: Text(
                    'Insira seu email e ra para receber a sua nova senha.',
                    style: TextStyle(fontSize: 15),
                  ),
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
                    controller: _email,
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
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo de Email em branco !';
                      }
                      return null;
                    },
                  ),
                ),
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
                      filled: true, //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      labelText: 'Ra',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo de Ra em branco !';
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
                recuperar(_email.text, _ra.text, context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Confirmar',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.yellow.shade100,
    );
  }
}
