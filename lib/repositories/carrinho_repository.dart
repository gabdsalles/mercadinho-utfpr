import 'package:flutter/material.dart';
import 'package:projeto_mercadinho/database/db.dart';
import '../models/produto.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';

class CarrinhoRepository extends ChangeNotifier {
  late Database db;

  List<Produto> _listaCarrinho = [];

  void adicionarCarrinho(Produto produto, int quantidade) async {
    db = await DB.instance.database;

    await db.transaction((txn) async {
      List<Map<String, dynamic>> produtosNoEstoque = await txn.query('produto');

      for (Map<String, dynamic> produtoEstoque in produtosNoEstoque) {
        if (produtoEstoque['nome'] == produto.nome) {
          int estoqueAtual = produtoEstoque['quantidade'];
          if (estoqueAtual >= quantidade) {
            int novoEstoque = estoqueAtual - quantidade;

            await txn.update(
              'produto',
              {'quantidade': novoEstoque},
              where: 'nome = ?',
              whereArgs: [produto.nome],
            );
          }
        }
      }
    });
  }

  void removerCarrinho(Produto produto, int quantidade) async {
    db = await DB.instance.database;
    List<Map<String, dynamic>> produtosNoEstoque = await db.query('produto');

    for (Map<String, dynamic> produtoEstoque in produtosNoEstoque) {
      if (produtoEstoque['nome'] == produto.nome) {
        int estoqueAtual = produtoEstoque['quantidade'];
        if (estoqueAtual >= quantidade) {
          int novoEstoque = estoqueAtual + quantidade;

          await db.update(
            'produto',
            {'quantidade': novoEstoque},
            where: 'nome = ?',
            whereArgs: [produto.nome],
          );
        }
      }
    }
  }

  List<Produto> get listaCarrinho {
    return _listaCarrinho;
  }

  double getValorTotal() {
    double valorTotal = 0;
    if (_listaCarrinho.isEmpty) return 0;
    for (int i = 0; i < _listaCarrinho.length; i++) {
      valorTotal += _listaCarrinho[i].preco * _listaCarrinho[i].quantidade;
    }

    return valorTotal;
  }

  // adicionarProduto(Produto produto) {
  //   _listaCarrinho.add(produto);
  //   notifyListeners();
  // }

  void adicionarProduto(Produto produto) {
    int index = _listaCarrinho.indexWhere((p) => p.nome == produto.nome);

    if (index != -1) {
      // Produto já existe na lista, aumentar a quantidade

      _listaCarrinho[index].quantidade += produto.quantidade;
    } else {
      // Produto não existe na lista, adicioná-lo
      _listaCarrinho.add(produto);
    }

    notifyListeners();
  }

  void removerProduto(Produto produto) {
    int index = _listaCarrinho.indexWhere((p) => p.nome == produto.nome);

    if (index != -1) {
      _listaCarrinho[index].quantidade -= produto.quantidade;
    } else {
      // Produto não existe na lista, adicioná-lo
      _listaCarrinho.add(produto);
    }

    notifyListeners();
  }
}
