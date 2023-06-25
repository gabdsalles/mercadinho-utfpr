// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors, camel_case_types, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_mercadinho/pages/editar_dados_page.dart';
import 'package:provider/provider.dart';
import '../pages/carrinho_page.dart';
import '../pages/produtos_page.dart';
import '../repositories/cadastro_repository.dart';

late CadastroRepository cadastro;

class Home_Page extends StatefulWidget {
  String mercado;

  Home_Page({required this.mercado});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home_Page> {
  late String dropdownValue;

  final List<String> produtos = [
    "Todos os Produtos",
    "Bebidas",
    "Bolachas",
    //"Higiene",
    "Remédios",
    "Salgadinhos",
  ];

  final List<String> imagens = [
    "images/seta.png",
    "images/refrigerantes.png",
    "images/bolachas.png",
    "images/remedios.png",
    //"images/higiene.png",
    "images/salgadinhos.png",
  ];

  List<String> markets = ['UTFPR', 'UEPG', 'Campus'];
  int cont = 0;

  @override
  Widget build(BuildContext context) {
    cadastro = context.watch<CadastroRepository>();

    if (cont == 0) {
      dropdownValue = widget.mercado;
      //print(cont);
      cont++;
    }

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('images/abelha.png'),
        actions: [
          DropdownButton<String>(
            value: dropdownValue,
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            items: markets.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
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
        backgroundColor: dropdownValue == "UTFPR"
            ? Colors.yellow.shade400
            : Colors.lightBlue.shade400,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(30),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500, // Largura
          mainAxisExtent: 120, // Altura
          mainAxisSpacing: 20,
        ),
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Produtos_Page(
                        texto: produtos[index], mercado: dropdownValue)),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(
                dropdownValue == "UTFPR"
                    ? Colors.amber.shade400
                    : Colors.blue.shade400,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: BorderSide(color: Colors.black),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  produtos[index],
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.asset(imagens[index]),
                ),

                // Espaço entre o ícone e o texto
              ],
            ),
          );
        },
      ),
      backgroundColor: dropdownValue == "UTFPR"
          ? Colors.yellow.shade200
          : Colors.blue.shade200,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          decoration: BoxDecoration(
            color: dropdownValue == "UTFPR"
                ? Colors.yellow.shade400
                : Colors.blue.shade400,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home_Page(mercado: dropdownValue),
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
                      builder: (context) =>
                          CarrinhoPage(mercado: dropdownValue),
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
                        CupertinoIcons.cart,
                        key: UniqueKey(),
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                    Text(
                      "Carrinho",
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
                              mercado: dropdownValue,
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
