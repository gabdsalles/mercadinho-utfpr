// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_mercadinho/models/produto.dart';
import 'package:projeto_mercadinho/pages/home_page.dart';
import 'package:projeto_mercadinho/repositories/produtos_repository.dart';
import 'package:provider/provider.dart';
import '../pages/item_page.dart';
import '../repositories/cadastro_repository.dart';
import 'carrinho_page.dart';
import 'editar_dados_page.dart';
import '../database/db.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

late CadastroRepository cadastro;

class Produtos_Page extends StatefulWidget {
  final String texto;
  final String mercado;
  const Produtos_Page({Key? key, required this.texto, required this.mercado})
      : super(key: key);

  @override
  State<Produtos_Page> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<Produtos_Page> {
  List<Produto> produtos = [];
  Uint8List? _imagemBytes;
  String? _imagemString = "";

  void atualizarProdutos() async {
    ProdutosRepository produtosRepository = ProdutosRepository();
    await produtosRepository.atualizarProdutosNoBanco();

    loadProdutos();
  }

  @override
  void initState() {
    super.initState();
    imagemString();
    loadProdutos();
    cadastro = context.read<CadastroRepository>();
  }

  Future<void> imagemString() async {
    CadastroRepository cadastroRepository = CadastroRepository();
    _imagemString = await cadastroRepository.acharImagem();
    if (_imagemString != null) {
      setState(() {
        _imagemBytes = base64Decode(_imagemString!);
      });
    } else {
      print("Imagem não encontrada");
    }
  }

  void loadProdutos() async {
    Database db = await DB.instance.database;
    ProdutosRepository produtosRepository = ProdutosRepository();
    await produtosRepository.inserirProdutos();

    List<Map<String, dynamic>> result = await db.query('produto');
    List<Produto> produtosList = [];
    for (Map<String, dynamic> row in result) {
      Produto produto = Produto.fromMap(row);
      //print(produto.nome + "  " + produto.categoria);
      if (produto.categoria == widget.texto &&
          produto.quantidade > 0 &&
          produto.mercado == widget.mercado)
        produtosList.add(produto);
      else if (widget.texto == "Todos os Produtos" &&
          produto.mercado == widget.mercado) produtosList.add(produto);
    }

    setState(() {
      produtos = produtosList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Home_Page(mercado: widget.mercado)),
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
                  child: _imagemBytes != null
                      ? Image.memory(
                          _imagemBytes!,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'images/foto_perfil.png',
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
          ),
        ],
        backgroundColor: widget.mercado == "UTFPR"
            ? Colors.yellow.shade400
            : Colors.lightBlue.shade400,
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
                  color: widget.mercado == "UTFPR"
                      ? Colors.amber.shade300
                      : Colors.blue.shade300,
                  border: Border.all(
                    color: Colors.black,
                    width: 1.2,
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Text(
                  widget.texto,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
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
                // Botões que são os ícones dos produtos
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemPage(
                          produto: produtos[index],
                          mercado: widget.mercado,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: widget.mercado == "UTFPR"
                          ? const Color.fromARGB(255, 250, 252, 232)
                          : Color.fromARGB(255, 193, 240, 255),
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
                                "R\$ ${produtos[index].preco.toString()}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
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
      backgroundColor: widget.mercado == "UTFPR"
          ? Colors.yellow.shade100
          : Colors.lightBlue.shade100,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          decoration: BoxDecoration(
            color: widget.mercado == "UTFPR"
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
                      builder: (context) => Home_Page(mercado: widget.mercado),
                    ),
                  );
                  // adicione aqui o código a ser executado ao clicar no ícone
                },
                child: Column(
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
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
                    const Text(
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
                          CarrinhoPage(mercado: widget.mercado),
                    ),
                  );
                  // adicione aqui o código a ser executado ao clicar no ícone
                },
                child: Column(
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
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
                    const Text(
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
                              mercado: widget.mercado,
                            )),
                  );
                  // adicione aqui o código a ser executado ao clicar no ícone
                },
                child: Column(
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
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
                    const Text(
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
                      duration: const Duration(milliseconds: 300),
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
                    const Text(
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
