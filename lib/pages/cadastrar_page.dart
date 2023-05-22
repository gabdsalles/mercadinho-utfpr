import 'package:flutter/material.dart';
import 'package:projeto_mercadinho/repositories/cadastro_repository.dart';
import 'package:provider/provider.dart';
import '../models/cadastrar.dart';
//import 'package:projeto_mercadinho/models/cadastrar.dart';
//import 'package:provider/provider.dart';

// ignore: camel_case_types, must_be_immutable
class Cadastrar_Page extends StatelessWidget {
  //final  dropValue = ValueNotifier('');
  //final dropOpcoes = ['Alterar dados da conta', 'Adicionar saldo', 'Sair'];
  late CadastroRepository cadastro;

  final _form = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _senha = TextEditingController();
  final _confirmarSenha = TextEditingController();
  final _nome = TextEditingController();
  final _ra = TextEditingController();
  final _curso = TextEditingController();
  final _imagem = TextEditingController();

  cadastrarUser(Cadastrar cadastrar, BuildContext context) {
    if (_form.currentState!.validate()) {
      cadastro.adicionarCadastro(cadastrar, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    cadastro = context.watch<CadastroRepository>();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Cadastrar'),
        ),
        backgroundColor: Colors.yellow.shade400,
      ),
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          Form(
            key: _form,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
                Container(
                  height: 75,
                  width: 300,
                  child: new TextFormField(
                    controller: _nome,
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
                      labelText: 'Nome',
                    ),
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo de Nome em branco !';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  height: 75,
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
                Container(
                  height: 75,
                  width: 300,
                  child: TextFormField(
                    controller: _curso,
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
                      labelText: 'Curso',
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo de Curso em branco !';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  height: 75,
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
                  height: 75,
                  width: 300,
                  child: TextFormField(
                    controller: _senha,
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
                      labelText: 'Senha',
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo de Senha em branco !';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  height: 75,
                  width: 300,
                  child: TextFormField(
                    controller: _confirmarSenha,
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
                      labelText: 'Confirmar Senha',
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo de Confirmar Senha em branco !';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  height: 75,
                  width: 300,
                  child: TextFormField(
                    controller: _imagem,
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
                      labelText: 'Imagem',
                    ),
                    keyboardType: TextInputType.url,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 250,
            alignment: Alignment.bottomCenter,
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
                if (_senha.value == _confirmarSenha.value) {
                  Cadastrar cadastrar = Cadastrar(
                      nome: _nome.text,
                      ra: _ra.text,
                      curso: _curso.text,
                      email: _email.text,
                      senha: _senha.text,
                      imagem: _imagem.text,
                      log: 0,
                      saldo: 0.0,
                      numero: 0);

                  // Mostra o coteudo do Carrinho_Page
                  cadastrarUser(cadastrar, context);
                } else {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('As senhas não são iguais')),
                  );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Cadastrar',
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

class AuthService {}
