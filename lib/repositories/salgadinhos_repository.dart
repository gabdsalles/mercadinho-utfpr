import '../models/produto.dart';

class SalgadinhoRepository {
  List<Produto> produtos = [
    Produto(
      nome: "Fandangos presunto",
      icone: "images/salgadinhos/fandangos.png",
      preco: 4.00,
      quantidade: 10,
    ),
    Produto(
      nome: "Passatempo ",
      icone: "images/salgadinhos/passatempo.png",
      preco: 2.10,
      quantidade: 4,
    ),
    Produto(
      nome: "Pípoteca cebola",
      icone: "images/salgadinhos/pipoteca.png",
      preco: 5.80,
      quantidade: 2,
    ),
    Produto(
      nome: "Traquinas Chocolate",
      icone: "images/salgadinhos/traquinas.png",
      preco: 2.00,
      quantidade: 7,
    ),
  ];

  get length => null;
}
