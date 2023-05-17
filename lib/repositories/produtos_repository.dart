import 'package:flutter/material.dart';

import '../models/produto.dart';

class ProdutosRepository extends ChangeNotifier {
  List<Produto> produtos = [
    Produto(
        nome: "Coca cola 350ml",
        icone: "images/bebidas/coca.png",
        preco: 5.50,
        quantidade: 5,
        categoria: "bebida"),
    Produto(
        nome: "Guaraná 350ml",
        icone: "images/bebidas/guarana.png",
        preco: 4.00,
        quantidade: 7,
        categoria: "bebida"),
    Produto(
        nome: "Fanta laranja 350ml",
        icone: "images/bebidas/fanta.png",
        preco: 5.00,
        quantidade: 3,
        categoria: "bebida"),
    Produto(
        nome: "Dipirona",
        icone: "images/remedios/dipirona.png",
        preco: 10.25,
        quantidade: 3,
        categoria: "remédio"),
    Produto(
        nome: "Engov ",
        icone: "images/remedios/engov.png",
        preco: 5.00,
        quantidade: 7,
        categoria: "remédio"),
    Produto(
        nome: "Neosaldina",
        icone: "images/remedios/neosaldina.png",
        preco: 21.85,
        quantidade: 15,
        categoria: "remédio"),
    Produto(
        nome: "Tylenol",
        icone: "images/remedios/tylenol.png",
        preco: 36.40,
        quantidade: 20,
        categoria: "remédio"),
    Produto(
        nome: "Fandangos presunto",
        icone: "images/salgadinhos/fandangos.png",
        preco: 4.00,
        quantidade: 10,
        categoria: "salgadinho"),
    Produto(
        nome: "Passatempo ",
        icone: "images/salgadinhos/passatempo.png",
        preco: 2.10,
        quantidade: 4,
        categoria: "salgadinho"),
    Produto(
        nome: "Pípoteca cebola",
        icone: "images/salgadinhos/pipoteca.png",
        preco: 5.80,
        quantidade: 2,
        categoria: "salgadinho"),
    Produto(
        nome: "Traquinas Chocolate",
        icone: "images/salgadinhos/traquinas.png",
        preco: 2.00,
        quantidade: 7,
        categoria: "salgadinho"),
  ];

  atualizarQuantidadeProduto(Produto produto, int quantidade) {
    produtos.forEach((produtoLista) {
      if (produto.nome == produtoLista.nome) {
        produtoLista.quantidade -= quantidade;
        print('Quantidade atualizada: ' + produtoLista.quantidade.toString());
      }
    });

    notifyListeners();
  }

  get length => null;
}
