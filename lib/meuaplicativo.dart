import 'package:flutter/material.dart';
import 'package:projeto_mercadinho/pages/home_page.dart';
import 'package:projeto_mercadinho/pages/login_page.dart';

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mercadinho Universitário',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      //home: Home_Page(),
      home: Login_Page(),
    );
  }
}
