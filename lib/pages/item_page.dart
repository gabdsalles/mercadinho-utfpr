// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:projeto_mercadinho/repositories/carrinho_repository.dart';
import '../pages/carrinho_page.dart';
import '../models/produto.dart';

class ItemPage extends StatelessWidget {
  final Produto produto;

  const ItemPage({Key? key, required this.produto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dropValue = ValueNotifier('');
    final dropOpcoes = adicionarQuantidade(produto.quantidade);
    var quantidade = 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Saldo R\$: 108,20"),
        backgroundColor: Colors.yellow,
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.orange.shade100,
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
                Produto carrinho = Produto(
                    icone: produto.icone,
                    nome: produto.nome,
                    quantidade: quantidade,
                    preco: produto.preco);
                CarrinhoRepository.listaCarrinho.add(carrinho);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarrinhoPage(),
                  ),
                );

                // Ação do botão
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
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
