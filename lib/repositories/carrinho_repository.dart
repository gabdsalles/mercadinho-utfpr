import 'dart:collection';

import 'package:flutter/material.dart';

import '../models/produto.dart';

class CarrinhoRepository extends ChangeNotifier {
  List<Produto> _listaCarrinho = [];

  UnmodifiableListView<Produto> get lista =>
      UnmodifiableListView(_listaCarrinho);

  double getValorTotal() {
    double valorTotal = 0;
    if (_listaCarrinho.isEmpty) return 0;
    for (int i = 0; i < _listaCarrinho.length; i++) {
      valorTotal += _listaCarrinho[i].preco * _listaCarrinho[i].quantidade;
    }

    return valorTotal;
  }

  adicionarProduto(Produto produto) {
    _listaCarrinho.add(produto);
    notifyListeners();
  }
}
