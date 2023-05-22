class Cadastrar {
  String nome;
  String ra;
  String curso;
  String email;
  String senha;
  String imagem;
  int log;
  double saldo;
  int numero;

  Cadastrar({
    required this.nome,
    required this.ra,
    required this.curso,
    required this.email,
    required this.senha,
    required this.imagem,
    required this.log,
    required this.saldo,
    required this.numero,
  });


  Map<String, dynamic> toMap(){
  
    return{
      'nome': nome,
      'ra': ra,
      'curso': curso,
      'email': email,
      'senha': senha,
      'imagem': imagem,
      'log': log,
      'saldo': saldo,
      'numero': numero,
    };
  }

  factory Cadastrar.fromMap(Map<dynamic,dynamic> map){
    return Cadastrar(
      nome: map['nome'],
      ra: map['ra'],
      curso: map['curso'],
      email: map['email'],
      senha: map['senha'],
      imagem: map['imagem'],
      log: map['log'],
      saldo: double.parse(map['saldo']),
      numero: map['numero'],
    );
  } 

}