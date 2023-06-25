import 'package:projeto_mercadinho/repositories/produtos_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:projeto_mercadinho/models/produto.dart';

class DB {
  DB._();
  static final DB instance = DB._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String path = join(await getDatabasesPath(), 'teste3.db');

    // Exclua o arquivo do banco de dados existente
    //await deleteDatabase(path);

    return await openDatabase(
      path,
      version: 1, // Defina a versão inicial do banco de dados
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(_cadastro);
    await db.execute(_produto);
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
    icone BLOB,
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
    icone BLOB,
    quantidade INTEGER,
    preco TEXT,
    categoria TEXT
  );
''';

  _cadastrarProdutos(Database db) async {
    List<Produto> lista = ProdutosRepository().produtos;

    for (Produto produto in lista) {
      await db.insert('produto', produto.toMap());
    }
  }
}
