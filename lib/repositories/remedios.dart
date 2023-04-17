import '../models/produto.dart';

class RemedioRepository {
  List<Produto> produtos = [
    Produto(
      nome: "Dipirona",
      icone: "images/remedios/dipirona.png",
      preco: 10.25,
      quantidade: 3,
    ),
    Produto(
      nome: "Engov ",
      icone: "images/remedios/engov.png",
      preco: 5.00,
      quantidade: 7,
    ),
    Produto(
      nome: "Neosaldina",
      icone: "images/remedios/neosaldina.png",
      preco: 21.85,
      quantidade: 15,
    ),
    Produto(
      nome: "Tylenol",
      icone: "images/remedios/tylenol.png",
      preco: 36.40,
      quantidade: 20,
    ),
  ];

  get length => null;
}
