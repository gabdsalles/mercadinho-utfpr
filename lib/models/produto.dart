class Produto {
  String icone;
  String nome;
  int quantidade;
  double preco;

  Produto({
    required this.icone,
    required this.nome,
    required this.quantidade,
    required this.preco,
  });

  String getNome() {
    return nome;
  }
}
