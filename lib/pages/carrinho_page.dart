import 'package:flutter/material.dart';
import 'package:projeto_mercadinho/repositories/cadastro_repository.dart';
import 'package:projeto_mercadinho/repositories/carrinho_repository.dart';
import 'package:projeto_mercadinho/repositories/produtos_repository.dart';
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
  late ProdutosRepository listaProdutos;
  late CarrinhoRepository carrinho;
  late CadastroRepository cadastro;
  late double valorTotal;

  @override
  Widget build(BuildContext context) {
    carrinho = context.watch<CarrinhoRepository>();
    cadastro = context.watch<CadastroRepository>();
    listaProdutos = context.watch<ProdutosRepository>();
    valorTotal = carrinho.getValorTotal();
    List<Produto> lista = carrinho.listaCarrinho;
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
        title: Text("Carrinho"),
        titleTextStyle: TextStyle(fontSize: 25, color: Colors.black),
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
        backgroundColor: Colors.yellow.shade400,
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int produto) {
          return Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 241, 238, 238),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
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
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${lista[produto].quantidade.toString()} Uni',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Atualiza o BD
                      int quantidade = lista[produto].quantidade;
                      carrinho.removerCarrinho(lista[produto], quantidade);
                      // Mostra o coteudo do Carrinho_Page
                      carrinho.removerProduto(lista[produto]);
                      // Atualiza a lista de produtos
                      listaProdutos.atualizarRemocaoCarrinho(
                          lista[produto], quantidade);
                      lista.removeAt(produto);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Produto removido do carrinho',
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.delete),
                    color: Colors.red,
                  ),
                ],
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            ),
          );
        },
        padding: EdgeInsets.all(8.0),
        separatorBuilder: (_, ___) => Divider(),
        itemCount: lista.length,
      ),
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
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
                    backgroundColor: Colors.amber.shade300,
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
