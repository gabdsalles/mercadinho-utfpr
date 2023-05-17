import 'package:flutter/material.dart';
import 'package:projeto_mercadinho/repositories/carrinho_repository.dart';
import 'package:projeto_mercadinho/repositories/produtos_repository.dart';
import 'package:provider/provider.dart';
import 'meuaplicativo.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<CarrinhoRepository>(
      create: (context) => CarrinhoRepository(),
    ),
    ChangeNotifierProvider<ProdutosRepository>(
      create: (context) => ProdutosRepository(),
    ),
  ], child: MeuAplicativo()));
}
