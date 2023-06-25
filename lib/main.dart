import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:projeto_mercadinho/repositories/carrinho_repository.dart';
import 'package:projeto_mercadinho/repositories/produtos_repository.dart';
import 'package:projeto_mercadinho/repositories/cadastro_repository.dart';
import 'package:projeto_mercadinho/services/location_controller.dart';
import 'package:provider/provider.dart';
import 'meuaplicativo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'models/produto.dart';

void writeData() {
  DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  ProdutosRepository prods = ProdutosRepository();
  List<Produto> produtos = prods.produtos;

  // Escrever os dados no nó "produtos"
  produtos.asMap().forEach((index, produto) {
    databaseReference
        .child('produtos')
        .child(index.toString())
        .set(produto.toMap());
  });

  print('passou pelo writedata');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp();
  }

  //writeData();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CadastroRepository>(
        create: (context) => CadastroRepository(),
      ),
      ChangeNotifierProvider<CarrinhoRepository>(
        create: (context) => CarrinhoRepository(),
      ),
      ChangeNotifierProvider<ProdutosRepository>(
        create: (context) => ProdutosRepository(),
      ),
      ChangeNotifierProvider<LocationController>(
        create: (context) => LocationController(),
      )
    ],
    child: MeuAplicativo(),
  ));
}
