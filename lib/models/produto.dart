class Produto {
  String icone;
  String nome;
  int quantidade;
  double preco;
  String categoria;

  Produto({
    required this.icone,
    required this.nome,
    required this.quantidade,
    required this.preco,
    required this.categoria,
  });

  String getNome() {
    return nome;
  }
}
