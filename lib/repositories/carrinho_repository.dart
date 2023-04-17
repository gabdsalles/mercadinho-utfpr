import '../models/produto.dart';

class CarrinhoRepository {
  static List<Produto> listaCarrinho = [];

  static double getValorTotal() {
    double valorTotal = 0;
    if (listaCarrinho.isEmpty) return 0;
    for (int i = 0; i < listaCarrinho.length; i++) {
      valorTotal += listaCarrinho[i].preco * listaCarrinho[i].quantidade;
    }

    return valorTotal;
  }
}
