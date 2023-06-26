// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:projeto_mercadinho/repositories/cadastro_repository.dart';
import 'package:projeto_mercadinho/repositories/carrinho_repository.dart';
import 'package:projeto_mercadinho/repositories/produtos_repository.dart';
import 'package:provider/provider.dart';
import '../pages/carrinho_page.dart';
import '../models/produto.dart';

import 'package:social_share/social_share.dart';

class ItemPage extends StatelessWidget {
  final Produto produto;
  final String mercado;
  late CarrinhoRepository carrinho;
  late ProdutosRepository listaProdutos;
  late CadastroRepository cadastro;

  ItemPage({Key? key, required this.produto, required this.mercado})
      : super(key: key);

  void compartilharPreco() {
    SocialShare.shareOptions(
        "Confira o preço do ${produto.nome} agora: ${produto.preco}");
  }

  @override
  Widget build(BuildContext context) {
    final dropValue = ValueNotifier('');
    final dropOpcoes = adicionarQuantidade(produto.quantidade);
    var quantidade = 1;
    carrinho = context.watch<CarrinhoRepository>();
    listaProdutos = context.watch<ProdutosRepository>();
    cadastro = context.watch<CadastroRepository>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mercado == "UTFPR"
            ? Colors.yellow.shade400
            : Colors.lightBlue.shade400,
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () => compartilharPreco(),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: mercado == "UTFPR"
                ? Colors.yellow.shade100
                : Colors.lightBlue.shade100,
            width: double.infinity,
            height: 330,
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  produto.icone,
                  height: 260,
                  width: 260,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          // Primeiro Container
          Container(
            padding: const EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Color.fromARGB(205, 245, 245, 245),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                )
              ],
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    produto.nome,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "R\$ ${produto.preco.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ]),
          ),
          const SizedBox(
            height: 15,
          ),
          // Segundo Container
          Container(
            padding: const EdgeInsets.all(14),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: Color.fromARGB(205, 245, 245, 245),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                )
              ],
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Disponibilidade ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        produto.quantidade.toString(),
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ]),
          ),
          // DropButton para escolher a quantidade de produtos

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: ValueListenableBuilder<String>(
              valueListenable: dropValue,
              builder: (BuildContext context, String value, _) {
                return DropdownButtonFormField<String>(
                  hint: Text(
                    "1",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  decoration: InputDecoration(
                    label: const Text(
                      "Unidades",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  value: (value.isEmpty) ? null : value,
                  onChanged: (escolha) {
                    dropValue.value = escolha.toString();
                    quantidade = int.parse(
                        escolha!); // atualize a variável quantidade aqui
                    escolha = escolha;
                  },
                  items: dropOpcoes
                      .map(
                        (op) => DropdownMenuItem(
                          value: op,
                          child: Text(op),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 1),
            child: ElevatedButton.icon(
              icon: Icon(Icons.shopping_cart),
              label: Text(
                "Adicionar ao carrinho",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Produto produtoCarrinho = Produto(
                    icone: produto.icone,
                    nome: produto.nome,
                    quantidade: quantidade,
                    preco: produto.preco,
                    categoria: produto.categoria,
                    mercado: produto.mercado);

                // Atualiza o BD
                carrinho.adicionarCarrinho(produto, quantidade);
                // Mostra o coteudo do Carrinho_Page
                carrinho.adicionarProduto(produtoCarrinho);
                // Atualiza a lista de produtos
                listaProdutos.atualizarQuantidadeProduto(produto, quantidade);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarrinhoPage(mercado: mercado),
                  ),
                );

                // Ação do botão
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: mercado == "UTFPR"
                    ? Colors.amber.shade300
                    : Colors.blue.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> adicionarQuantidade(int numero) {
  List<String> lista = [];

  for (int i = 1; i <= numero; i++) {
    lista.add(i.toString());
  }
  return lista;
}
