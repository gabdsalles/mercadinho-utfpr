import '../models/produto.dart';

class produtoRepository {
  static List<Produto> listaProdutos = [
    Produto(
      icone: 'images/coca.png',
      nome: 'Coca-Cola lata',
      quantidade: 15,
      preco: 3.50,
    ),
    Produto(
      icone: 'images/batata.png',
      nome: 'Batata Frita porção',
      quantidade: 6,
      preco: 15.99,
    ),
    Produto(
      icone: 'images/oreo.png',
      nome: 'Bolacha Oreo',
      quantidade: 50,
      preco: 2.50,
    ),
    Produto(
      icone: 'images/paracetamol.png',
      nome: 'Paracetamol',
      quantidade: 20,
      preco: 10.00,
    ),
    Produto(
      icone: 'images/salad.png',
      nome: 'Salada',
      quantidade: 12,
      preco: 16.00,
    ),
    Produto(
      icone: 'images/coxinha.png',
      nome: 'Coxinha',
      quantidade: 14,
      preco: 6.00,
    ),
    Produto(
      icone: 'images/pipoca.png',
      nome: 'Pipoca de Microondas',
      quantidade: 40,
      preco: 4.50,
    ),
  ];
}
