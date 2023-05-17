import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:projeto_mercadinho/repositories/carrinho_repository.dart';
import 'package:provider/provider.dart';
import '../models/produto.dart';
import 'pagamento_page.dart';
import 'home_page.dart';

class CarrinhoPage extends StatefulWidget {
  const CarrinhoPage({Key? key}) : super(key: key);

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  //final List<Produto> lista = CarrinhoRepository.listaCarrinho;
  late CarrinhoRepository carrinho;
  late double valorTotal;

  @override
  Widget build(BuildContext context) {
    carrinho = context.watch<CarrinhoRepository>();
    valorTotal = carrinho.getValorTotal();
    UnmodifiableListView<Produto> lista = carrinho.lista;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home_Page()),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
              tag: 'foto_perfil',
              child: GestureDetector(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset('images/foto_perfil.png'),
                ),
              ),
            ),
          ),
        ],
        title: const Text("Saldo R\$: 108,20"),
        backgroundColor: Colors.yellow,
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int produto) {
            return ListTile(
              leading: Image.asset(lista[produto].icone),
              title: Text(
                lista[produto].nome,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                "R\$: ${lista[produto].preco.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              trailing: Text(
                '${lista[produto].quantidade.toString()} Uni',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            );
          },
          padding: EdgeInsets.all(8.0),
          separatorBuilder: (_, ___) => Divider(),
          itemCount: lista.length),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total: ",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "R\$: ${valorTotal.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 1),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.payment),
                  label: Text(
                    "Finalizar Compra",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Pagamento_Page(),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Redirecionando para o pagamento')),
                    );
                    // Ação do botão
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
