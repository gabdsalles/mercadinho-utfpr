class Produto {
  String icone;
  String nome;
  int quantidade;
  double preco;
  String categoria;
  String mercado;

  Produto(
      {required this.nome,
      required this.icone,
      required this.quantidade,
      required this.preco,
      required this.categoria,
      required this.mercado});

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
      'mercado': mercado
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
        nome: map['nome'],
        icone: map['icone'],
        quantidade: map['quantidade'],
        preco: double.parse(map['preco']),
        categoria: map['categoria'],
        mercado: map['mercado']);
  }
}
