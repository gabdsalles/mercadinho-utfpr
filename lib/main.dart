import 'package:flutter/material.dart';
import 'package:projeto_mercadinho/repositories/carrinho_repository.dart';
import 'package:projeto_mercadinho/repositories/produtos_repository.dart';
import 'package:projeto_mercadinho/repositories/cadastro_repository.dart';
import 'package:provider/provider.dart';
import 'meuaplicativo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<CadastroRepository>(
      create: (context) => CadastroRepository(),
    ),
    ChangeNotifierProvider<CarrinhoRepository>(
      create: (context) => CarrinhoRepository(),
    ),
    ChangeNotifierProvider<ProdutosRepository>(
      create: (context) => ProdutosRepository(),
    ),
  ], child: MeuAplicativo()));
}