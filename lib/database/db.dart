import 'package:projeto_mercadinho/repositories/produtos_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:projeto_mercadinho/models/produto.dart';

class DB {
  DB._();
  static final DB instance = DB._();
  static Database? _database;

  get database async {
    if (_database != null) return _database;
    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'teste3.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_cadastro);
    await db.execute(_produto2);
    await db.execute(_carrinho);

    await _cadastrarProdutos(db);
  }

  String get _cadastro => '''
  CREATE TABLE cadastro(
    nome TEXT,
    ra INTEGER PRIMARY KEY,
    curso TEXT,
    email TEXT,
    senha TEXT,
    imagem TEXT,
    log INTEGER,
    saldo REAL,
    numero INTEGER
  );
''';

  String get _produto => '''
  CREATE TABLE produto(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    icone TEXT,
    quantidade INTEGER,
    preco TEXT,
    categoria TEXT,
  );
''';

  String get _produto2 => '''
  CREATE TABLE produto2(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    icone TEXT,
    quantidade INTEGER,
    preco TEXT,
    categoria TEXT,
    mercado TEXT
  );
''';

  String get _carrinho => '''
  CREATE TABLE carrinho(
    ra INTEGER PRIMARY KEY,
    nome TEXT,
    icone TEXT,
    quantidade INTEGER,
    preco TEXT,
    categoria TEXT
  );
''';

  _cadastrarProdutos(Database db) async {
    List<Produto> lista = ProdutosRepository().produtos;

    for (Produto produto in lista) {
      await db.insert('produto2', produto.toMap());
    }
  }
}
