import '../models/produto.dart';

class BebidaRepository {
  List<Produto> produtos = [
    Produto(
      nome: "Coca cola 350ml",
      icone: "images/bebidas/coca.png",
      preco: 5.50,
      quantidade: 5,
    ),
    Produto(
      nome: "Guaraná 350ml",
      icone: "images/bebidas/guarana.png",
      preco: 4.00,
      quantidade: 7,
    ),
    Produto(
      nome: "Fanta laranja 350ml",
      icone: "images/bebidas/fanta.png",
      preco: 5.00,
      quantidade: 3,
    ),
  ];

  get length => null;
}
