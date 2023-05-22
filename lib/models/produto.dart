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

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'icone': icone,
      'quantidade': quantidade,
      'preco': preco,
      'categoria': categoria,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      nome: map['nome'],
      icone: map['icone'],
      quantidade: map['quantidade'],
      preco: double.parse(map['preco']),
      categoria: map['categoria'],
    );
  }
}
