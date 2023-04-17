import 'package:flutter/material.dart';
import 'package:projeto_mercadinho/pages/editar_dados.dart';
import 'package:projeto_mercadinho/pages/produtos_page.dart';

import 'login.dart';
import 'merc_home.dart';

class Opcoes_Pagamento extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final _form2 = GlobalKey<FormState>();
  final _addSaldo = TextEditingController();
  final _numeroCartao = TextEditingController();
  final _nomeCartao = TextEditingController();

  addSaldo() {
    if (_form.currentState!.validate()) {
      return true;
    }
    return false;
  }

  addCartao() {
    if (_form2.currentState!.validate()) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Opções de Pagamento'),
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
                bool a = addSaldo();
                if (a) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Saldo adicionado com sucesso!')),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProdutosPage(
                              texto: '',
                            )),
                  );
                } else {
                  return null;
                }
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
                Container(
                  height: 75,
                  width: 300,
                  child: TextFormField(
                    controller: _nomeCartao,
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
                      labelText: 'Nome:',
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo de Nome do cartão em branco !';
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
                bool a = addCartao();
                if (a) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Cartão adicionado com sucesso!')),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProdutosPage(
                              texto: '',
                            )),
                  );
                } else {
                  return null;
                }
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
            context,
            //MaterialPageRoute(builder: (context) => ProdutosPage(texto: '')),
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
                      builder: (context) =>
                          MercHome(),
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
                    MaterialPageRoute(builder: (context) => Editar_Dados()),
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
