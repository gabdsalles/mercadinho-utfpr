import 'package:flutter/material.dart';
import 'package:projeto_mercadinho/database/db.dart';
import 'package:sqflite/sqlite_api.dart';
import '../models/produto.dart';

class ProdutosRepository extends ChangeNotifier {
  late Database db;
  List<Produto> get prods => produtos;
  int get length => produtos.length;

  List<Produto> produtos = [
    Produto(
        nome: "Água mineral",
        icone: "images/bebidas/agua.png",
        preco: 2.50,
        quantidade: 47,
        categoria: "Bebidas",
        mercado: "UTFPR"),
    Produto(
        nome: "Coca cola 350ml",
        icone: "images/bebidas/coca.png",
        preco: 5.50,
        quantidade: 50,
        categoria: "Bebidas",
        mercado: "UEPG"),
    Produto(
        nome: "Guaraná 350ml",
        icone: "images/bebidas/guarana.png",
        preco: 4.00,
        quantidade: 70,
        categoria: "Bebidas",
        mercado: "Campus"),
    Produto(
        nome: "Fanta laranja 350ml",
        icone: "images/bebidas/fanta.png",
        preco: 5.00,
        quantidade: 30,
        categoria: "Bebidas",
        mercado: "UTFPR"),
    Produto(
        nome: "Sprite 350ml",
        icone: "images/bebidas/sprite.png",
        preco: 4.80,
        quantidade: 50,
        categoria: "Bebidas",
        mercado: "UEPG"),
    Produto(
        nome: "Monster Mango Loco",
        icone: "images/bebidas/monster.png",
        preco: 8.50,
        quantidade: 15,
        categoria: "Bebidas",
        mercado: "Campus"),
    Produto(
        nome: "Dipirona",
        icone: "images/remedios/dipirona.png",
        preco: 10.25,
        quantidade: 30,
        categoria: "Remédios",
        mercado: "UTFPR"),
    Produto(
        nome: "Engov ",
        icone: "images/remedios/engov.png",
        preco: 5.00,
        quantidade: 70,
        categoria: "Remédios",
        mercado: "UEPG"),
    Produto(
        nome: "Neosaldina",
        icone: "images/remedios/neosaldina.png",
        preco: 21.85,
        quantidade: 150,
        categoria: "Remédios",
        mercado: "Campus"),
    Produto(
        nome: "Tylenol",
        icone: "images/remedios/tylenol.png",
        preco: 36.40,
        quantidade: 200,
        categoria: "Remédios",
        mercado: "UTFPR"),
    Produto(
        nome: "Baconzitos",
        icone: "images/salgadinhos/baconzitos.png",
        preco: 4.00,
        quantidade: 100,
        categoria: "Salgadinhos",
        mercado: "UTFPR"),
    Produto(
        nome: "Torcida cebola",
        icone: "images/salgadinhos/torcida.png",
        preco: 2.00,
        quantidade: 80,
        categoria: "Salgadinhos",
        mercado: "UEPG"),
    Produto(
        nome: "Pipoteca cebola",
        icone: "images/salgadinhos/pipoteca.png",
        preco: 5.80,
        quantidade: 200,
        categoria: "Salgadinhos",
        mercado: "Campus"),
    Produto(
        nome: "Fandangos presunto",
        icone: "images/salgadinhos/fandangos.png",
        preco: 4.00,
        quantidade: 100,
        categoria: "Salgadinhos",
        mercado: "UTFPR"),
    Produto(
        nome: "Pringles",
        icone: "images/salgadinhos/pringles.png",
        preco: 12.50,
        quantidade: 34,
        categoria: "Salgadinhos",
        mercado: "UEPG"),
    Produto(
        nome: "Calipso",
        icone: "images/bolachas/calipso.png",
        preco: 8.35,
        quantidade: 15,
        categoria: "Bolachas",
        mercado: "UTFPR"),
    Produto(
        nome: "Oreo",
        icone: "images/bolachas/oreo.png",
        preco: 4.35,
        quantidade: 15,
        categoria: "Bolachas",
        mercado: "UEPG"),
    Produto(
        nome: "Passatempo ",
        icone: "images/bolachas/passatempo.png",
        preco: 2.10,
        quantidade: 40,
        categoria: "Bolachas",
        mercado: "Campus"),
    Produto(
        nome: "Toddy ",
        icone: "images/bolachas/toddy.png",
        preco: 2.10,
        quantidade: 40,
        categoria: "Bolachas",
        mercado: "UTFPR"),
    Produto(
        nome: "Traquinas Chocolate",
        icone: "images/bolachas/traquinas.png",
        preco: 2.00,
        quantidade: 70,
        categoria: "Bolachas",
        mercado: "UEPG"),
  ];

  String get _produto2 => '''
  CREATE TABLE produto2(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    icone TEXT,
    quantidade INTEGER,
    preco TEXT,
    categoria TEXT,
    mercado TEXT
  );
  ''';

  Future<void> inserirProdutos() async {
    db = await DB.instance.database;

    for (Produto produto in produtos) {
      List<Map<String, dynamic>> result = await db.query(
        'produto',
        where: 'nome = ?',
        whereArgs: [produto.nome],
        limit: 1,
      );

      if (result.isEmpty) {
        await db.insert('produto', produto.toMap());
      }
    }
  }

  Future<void> atualizarProdutosNoBanco() async {
    db = await DB.instance.database;

    for (Produto produto in produtos) {
      await attProduto(produto);
    }
  }

  Future<void> attProduto(Produto produto) async {
    await db.update(
      'produto',
      produto.toMap(),
      where: 'nome = ?',
      whereArgs: [produto.nome],
    );
  }

  Future<void> atualizarProduto(Produto produto, String novaCategoria) async {
    db = await DB.instance.database;

    produto.categoria = novaCategoria;

    await db.update(
      'produto',
      produto.toMap(),
      where: 'nome = ?',
      whereArgs: [produto.nome],
    );
  }

  atualizarQuantidadeProduto(Produto produto, int quantidade) {
    produtos.forEach((produtoLista) {
      if (produto.nome == produtoLista.nome)
        produtoLista.quantidade -= quantidade;
    });

    notifyListeners();
  }

  Future<void> removerProdutoPorNome(String nome) async {
    Database db = await DB.instance.database;
    await db.delete('produto', where: 'nome = ?', whereArgs: [nome]);
  }

  atualizarRemocaoCarrinho(Produto produto, int quantidade) {
    produtos.forEach((produtoLista) {
      if (produto.nome == produtoLista.nome)
        produtoLista.quantidade += quantidade;
    });
  }
}
