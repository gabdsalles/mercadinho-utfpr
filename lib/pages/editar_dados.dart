import 'package:flutter/material.dart';
import 'package:projeto_mercadinho/pages/login.dart';
import 'package:projeto_mercadinho/pages/opcoes_pagamento.dart';
import 'package:projeto_mercadinho/pages/produtos_page.dart';

import 'merc_home.dart';

class Editar_Dados extends StatelessWidget {
  //final  dropValue = ValueNotifier('');
  //final dropOpcoes = ['Alterar dados da conta', 'Adicionar saldo', 'Sair'];

  final _form = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _senha = TextEditingController();
  final _confirmarSenha = TextEditingController();
  final _nome = TextEditingController();
  final _ra = TextEditingController();
  final _curso = TextEditingController();
  final _imagem = TextEditingController();

  editar() {
    if (_form.currentState!.validate()) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Editar Dados'),
        ),
        leading: Image.asset('images/abelha.png'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
              tag: 'foto_perfil',
              child: GestureDetector(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset('images/foto_perfil.png'),
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.yellow,
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
                    keyboardType: TextInputType.text,
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
                  Colors.amber,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              onPressed: () {
                bool a = editar();
                if (_senha.value == _confirmarSenha.value) {
                  if (a) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Dados alterados com sucesso!')),
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  } else {
                    return null;
                  }
                } else {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('As senhas não são iguais')),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Editar_Dados()),
                  );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Salvar Alterações',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProdutosPage(
                      texto: '',
                    )),
          );
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.amber,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(100)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      backgroundColor: Colors.yellow,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.yellow,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MercHome(),
                    ),
                  );
                  // adicione aqui o código a ser executado ao clicar no ícone
                },
                child: Column(
                  children: [
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(
                          scale: animation,
                          child: child,
                        );
                      },
                      child: Icon(
                        Icons.home,
                        key: UniqueKey(),
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Opcoes_Pagamento()),
                  );
                  // adicione aqui o código a ser executado ao clicar no ícone
                },
                child: Column(
                  children: [
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(
                          scale: animation,
                          child: child,
                        );
                      },
                      child: Icon(
                        Icons.credit_card,
                        key: UniqueKey(),
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                    Text(
                      "Pagamento",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                  // adicione aqui o código a ser executado ao clicar no ícone
                },
                child: Column(
                  children: [
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(
                          scale: animation,
                          child: child,
                        );
                      },
                      child: Icon(
                        Icons.logout,
                        key: UniqueKey(),
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
