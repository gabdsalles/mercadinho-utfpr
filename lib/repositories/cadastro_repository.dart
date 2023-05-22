import 'package:flutter/material.dart';
import 'package:projeto_mercadinho/database/db.dart';
import 'package:projeto_mercadinho/pages/editar_dados_page.dart';
import 'package:projeto_mercadinho/pages/opcoes_pagamento_page.dart';
import 'package:projeto_mercadinho/pages/recuperar_senha_page.dart';
import 'package:sqflite/sqlite_api.dart';
import '../models/cadastrar.dart';
import 'package:sqflite/sqflite.dart';
import '../models/produto.dart';
import '../pages/cadastrar_page.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';

//import '../models/cadastrar.dart';

class CadastroRepository extends ChangeNotifier {
  late Database db;

  void adicionarCadastro(Cadastrar cadastro, BuildContext context) async {
    db = await DB.instance.database;

    await db.transaction((txn) async {
      List<Map<String, dynamic>> result = await txn.query(
        'cadastro',
        where: 'ra = ?',
        whereArgs: [cadastro.ra],
        limit: 1,
      );

      if (result.isEmpty) {
        await txn.insert('cadastro', cadastro.toMap());
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Cadastrado com sucesso!')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login_Page()),
        );
      } else {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Já exite um cadastro com este RA!')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Cadastrar_Page()),
        );
      }
    });
    notifyListeners();
  }

  void login(String ra, String senha, BuildContext context) async {
    db = await DB.instance.database;
    await db.transaction((txn) async {
      List<Map<String, dynamic>> result = await txn.query(
        'cadastro',
        where: 'ra = ? AND senha = ?',
        whereArgs: [ra, senha],
        limit: 1,
      );

      if (result.isEmpty) {
        /*       QuickAlert.show(
 context: context,
 type: QuickAlertType.error,
 text: 'Email ou senha errados',
);*/
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ra ou senha errados!')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login_Page()),
        );
      } else {
        await txn.update(
          'cadastro',
          {'log': 1},
          where: 'ra = ?',
          whereArgs: [ra],
        );
/*
                QuickAlert.show(
 context: context,
 type: QuickAlertType.success,
 text: 'Logado com sucesso!',
 
);*/
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login realizado com sucesso!')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home_Page()),
        );
      }
    });
    notifyListeners();
  }

  void logout(BuildContext context) async {
    db = await DB.instance.database;
    await db.transaction((txn) async {
      List<Map<String, dynamic>> result = await txn.query(
        'cadastro',
        where: 'log = ? ',
        whereArgs: [1],
        limit: 1,
      );

      if (result.isEmpty) {
        /*       QuickAlert.show(
 context: context,
 type: QuickAlertType.error,
 text: 'Email ou senha errados',
);*/
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ocorreu um erro ao deslogar')),
        );
      } else {
        await txn.update(
          'cadastro',
          {'log': 0},
          where: 'log = ?',
          whereArgs: [1],
        );
/*
                QuickAlert.show(
 context: context,
 type: QuickAlertType.success,
 text: 'Logado com sucesso!',
 
);*/
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Logout realizado com sucesso!')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login_Page()),
        );
      }
    });
    notifyListeners();
  }

  void recuperarSenha(String email, String ra, BuildContext context) async {
    db = await DB.instance.database;
    await db.transaction((txn) async {
      List<Map<String, dynamic>> result = await txn.query(
        'cadastro',
        columns: ['senha'],
        where: 'email = ? AND ra = ?',
        whereArgs: [email, ra],
        limit: 1,
      );

      if (result.isEmpty) {
        /*       QuickAlert.show(
 context: context,
 type: QuickAlertType.error,
 text: 'Email ou senha errados',
);*/
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Email ou ra errados!')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Recuperar_Senha_Page()),
        );
      } else {
/*
                QuickAlert.show(
 context: context,
 type: QuickAlertType.success,
 text: 'Logado com sucesso!',
 
);*/

        final String a = result.toString();

        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Você receberá uma notificação com sua senha.!' + a)),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login_Page()),
        );
      }
    });
    notifyListeners();
  }

  void editarCadastro(Cadastrar cadastro, BuildContext context) async {
    db = await DB.instance.database;
    int a = 1;

    await db.transaction((txn) async {
      List<Map<String, dynamic>> result = await txn.query(
        'cadastro',
        where: 'log = ?',
        whereArgs: [a],
        limit: 1,
      );

      if (result.isEmpty) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Impossível eidtar os dados do cadastro')),
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Editar_Dados_Page()),
        );
      }

      await txn.update(
        'cadastro',
        {
          'nome': cadastro.nome,
          'curso': cadastro.curso,
          'email': cadastro.email,
          'senha': cadastro.senha,
          'imagem': cadastro.imagem
        },
        where: 'log = ?',
        whereArgs: [a],
      );
    });
    notifyListeners();
  }

  void addSaldo(double saldo, BuildContext context) async {
    db = await DB.instance.database;
    int a = 1;

    await db.transaction((txn) async {
      List<Map<String, dynamic>> result = await txn.query(
        'cadastro',
        where: 'log = ?',
        whereArgs: [a],
        limit: 1,
      );

      if (result.isEmpty) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Impossível adicionar saldo')),
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Opcoes_Pagamento_Page()),
        );
      }

      await txn.update(
        'cadastro',
        {'saldo': saldo},
        where: 'log = ?',
        whereArgs: [a],
      );
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saldo adicionado')),
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Opcoes_Pagamento_Page()),
      );
    });
    notifyListeners();
  }

  void addCartao(int num, BuildContext context) async {
    db = await DB.instance.database;
    int a = 1;

    await db.transaction((txn) async {
      List<Map<String, dynamic>> result = await txn.query(
        'cadastro',
        where: 'log = ?',
        whereArgs: [a],
        limit: 1,
      );

      if (result.isEmpty) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Impossível adicionar cartao')),
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Opcoes_Pagamento_Page()),
        );
      }

      await txn.update(
        'cadastro',
        {'numero': num},
        where: 'log = ?',
        whereArgs: [a],
      );
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cartao adicionado')),
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Opcoes_Pagamento_Page()),
      );
    });
    notifyListeners();
  }
}
