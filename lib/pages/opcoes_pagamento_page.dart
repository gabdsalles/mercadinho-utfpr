// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:projeto_mercadinho/pages/editar_dados_page.dart';
import 'package:provider/provider.dart';

import '../repositories/cadastro_repository.dart';
import 'home_page.dart';

// ignore: camel_case_types
class Opcoes_Pagamento_Page extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final _form2 = GlobalKey<FormState>();
  final _addSaldo = TextEditingController();
  final _numeroCartao = TextEditingController();
  //final _nomeCartao = TextEditingController();

  final String mercado;

  Opcoes_Pagamento_Page({required this.mercado});

  late CadastroRepository cadastro;

  addSaldo(double add, BuildContext context) {
    if (_form.currentState!.validate()) {
      cadastro.addSaldo(add, context);
    }
  }

  addCartao(int num, BuildContext context) {
    if (_form.currentState!.validate()) {
      cadastro.addCartao(num, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    cadastro = context.watch<CadastroRepository>();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Opções de Pagamento'),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Home_Page(
                        mercado: mercado,
                      )),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
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
        backgroundColor: mercado == "UTFPR"
            ? Colors.yellow.shade400
            : Colors.lightBlue.shade400,
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
                  child: SizedBox(
                      child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(60.0), //<-- SEE HERE
                    ),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: Text(
                          'Adicionar Saldo (Fiado)',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
                ),
                Container(
                  height: 75,
                  width: 300,
                  child: TextFormField(
                    controller: _addSaldo,
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
                      labelText: 'Valor:',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo de Valor em branco !';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                  mercado == 'UTFPR'
                      ? Colors.amber.shade300
                      : Colors.blue.shade300,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              onPressed: () {
                addSaldo(double.parse(_addSaldo.text), context);
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
          Form(
            key: _form2,
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
                  child: SizedBox(
                      child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(60.0), //<-- SEE HERE
                    ),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: Text(
                          'Adicionar Cartão',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
                ),
                Container(
                  height: 75,
                  width: 300,
                  child: TextFormField(
                    controller: _numeroCartao,
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
                      labelText: 'Número:',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo de Número do cartão em branco !';
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
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                  mercado == 'UTFPR'
                      ? Colors.amber.shade300
                      : Colors.blue.shade300,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              onPressed: () {
                addCartao(int.parse(_numeroCartao.text), context);
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
      backgroundColor: mercado == 'UTFPR'
          ? Colors.yellow.shade100
          : Colors.lightBlue.shade100,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          decoration: BoxDecoration(
            color: mercado == 'UTFPR'
                ? Colors.yellow.shade400
                : Colors.lightBlue.shade400,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home_Page(
                        mercado: mercado,
                      ),
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
                    MaterialPageRoute(
                        builder: (context) => Editar_Dados_Page(
                              mercado: mercado,
                            )),
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
                        Icons.person,
                        key: UniqueKey(),
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                    Text(
                      "Perfil",
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
                  cadastro.logout(context);
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
