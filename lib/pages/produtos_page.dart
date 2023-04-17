// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_mercadinho/pages/merc_home.dart';
import '../pages/item_page.dart';
import '../repositories/bebidas.dart';
import '../repositories/remedios.dart';
import '../repositories/salgadinhos.dart';
import 'carrinho_page.dart';
import 'editar_dados.dart';
import 'login.dart';

class ProdutosPage extends StatefulWidget {
  final String texto;

  const ProdutosPage({Key? key, required this.texto}) : super(key: key);

  @override
  State<ProdutosPage> createState() => _BebidasPageState();
}

class _BebidasPageState extends State<ProdutosPage> {
  List<dynamic> produtos = [];

  @override
  Widget build(BuildContext context) {
    if (widget.texto == "Bebidas") {
      produtos = BebidaRepository().produtos;
    } else if (widget.texto == "Salgadinhos \ne Bolachas") {
      produtos = SalgadinhoRepository().produtos;
    } else if (widget.texto == "Remédios") {
      produtos = RemedioRepository().produtos;
    } else {
      produtos.addAll(
        BebidaRepository().produtos +
            SalgadinhoRepository().produtos +
            RemedioRepository().produtos,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Saldo R\$: 108,20"),
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
      body: Column(
        children: [
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                margin: const EdgeInsets.only(top: 15, left: 15),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  border: Border.all(
                    color: Colors.black,
                    width: 1.2,
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Text(
                  widget.texto,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Container(
                    // Conteúdo da parte direita
                    ),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250, // Largura
                mainAxisExtent: 250, // Altura
                crossAxisSpacing: 20, // Espaçamento horizontal
                mainAxisSpacing: 20, // Espaçamento vertical
              ),
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                // Botões que são os icones dos produtos
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemPage(
                          produto: produtos[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 230, 225, 232),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      children: [
                        InkWell(
                          child: Image.asset(
                            produtos[index].icone,
                            fit: BoxFit.contain,
                            height: 130,
                            width: 120,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                produtos[index].nome,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "R\$ " + produtos[index].preco.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.amber,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.yellow,
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
                    MaterialPageRoute(
                      builder: (context) => CarrinhoPage(),
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
