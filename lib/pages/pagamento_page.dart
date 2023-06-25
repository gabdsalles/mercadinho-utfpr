import 'package:flutter/material.dart';
import 'package:projeto_mercadinho/pages/home_page.dart';
import '../pages/carrinho_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:projeto_mercadinho/pages/editar_dados_page.dart';

// ignore: camel_case_types
class Pagamento_Page extends StatelessWidget {
  final String mercado;

  Pagamento_Page({required this.mercado});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Pagamento'),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Home_Page(mercado: mercado)),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
              tag: 'foto_perfil',
              child: GestureDetector(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset('images/foto_perfil.png'),
                ),
              ),
            ),
          ),
        ],
        backgroundColor:
            mercado == "UTFPR" ? Colors.yellow.shade400 : Colors.blue.shade400,
      ),
      body: MyStatefulWidget(mercado: mercado),
      backgroundColor:
          mercado == "UTFPR" ? Colors.yellow.shade200 : Colors.blue.shade200,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          decoration: BoxDecoration(
            color: mercado == "UTFPR"
                ? Colors.yellow.shade200
                : Colors.blue.shade200,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home_Page(mercado: mercado),
                    ),
                  );
                  // adicione aqui o código a ser executado ao clicar no ícone
                },
                child: Column(
                  children: [
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(
                          scale: animation,
                          child: child,
                        );
                      },
                      child: Icon(
                        Icons.home,
                        key: UniqueKey(),
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CarrinhoPage(mercado: mercado),
                    ),
                  );
                  // adicione aqui o código a ser executado ao clicar no ícone
                },
                child: Column(
                  children: [
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(
                          scale: animation,
                          child: child,
                        );
                      },
                      child: Icon(
                        CupertinoIcons.cart,
                        key: UniqueKey(),
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                    Text(
                      "Carrinho",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Editar_Dados_Page(
                              mercado: mercado,
                            )),
                  );
                  // adicione aqui o código a ser executado ao clicar no ícone
                },
                child: Column(
                  children: [
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(
                          scale: animation,
                          child: child,
                        );
                      },
                      child: Icon(
                        Icons.person,
                        key: UniqueKey(),
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                    Text(
                      "Perfil",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  cadastro.logout(context);
                  // adicione aqui o código a ser executado ao clicar no ícone
                },
                child: Column(
                  children: [
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(
                          scale: animation,
                          child: child,
                        );
                      },
                      child: Icon(
                        Icons.logout,
                        key: UniqueKey(),
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  final String mercado;

  const MyStatefulWidget({Key? key, required this.mercado}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

enum Pagar { cartao, saldo, pix }

/// private State class that goes with MyStatefulWidget
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Pagar? _pagar = Pagar.cartao;

  @override
  Widget build(BuildContext context) {
    final yellowBoxDecoration = BoxDecoration(
      color: widget.mercado == "UTFPR"
          ? Colors.yellow.shade200
          : Colors.blue.shade200,
    );

    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(children: [
        Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 380.0,
                height: 10.0,
                child: DecoratedBox(
                  decoration: yellowBoxDecoration,
                ),
              ),
              Text(
                '  Escolher Forma de Pagamento    ',
                style: TextStyle(
                    height: 1,
                    fontSize: 26.18,
                    fontWeight: FontWeight.bold,
                    backgroundColor: widget.mercado == "UTFPR"
                        ? Colors.yellow.shade200
                        : Colors.blue.shade200),
              ),
              SizedBox(
                width: 380.0,
                height: 50.0,
                child: DecoratedBox(
                  decoration: yellowBoxDecoration,
                ),
              ),
              ListTile(
                tileColor: widget.mercado == "UTFPR"
                    ? Colors.yellow.shade200
                    : Colors.blue.shade200,
                title: const Text('Cartão'),
                leading: Radio<Pagar>(
                  fillColor:
                      MaterialStateColor.resolveWith((states) => Colors.black),
                  value: Pagar.cartao,
                  groupValue: _pagar,
                  onChanged: (Pagar? value) {
                    setState(() {
                      _pagar = value;
                    });
                  },
                ),
                trailing: Icon(Icons.credit_card),
              ),
              ListTile(
                tileColor: widget.mercado == "UTFPR"
                    ? Colors.yellow.shade200
                    : Colors.blue.shade200,
                title: const Text('Pix'),
                leading: Radio<Pagar>(
                  fillColor:
                      MaterialStateColor.resolveWith((states) => Colors.black),
                  value: Pagar.pix,
                  groupValue: _pagar,
                  onChanged: (Pagar? value) {
                    setState(() {
                      _pagar = value;
                    });
                  },
                ),
                trailing: Icon(Icons.pix_outlined),
              ),
              ListTile(
                tileColor: widget.mercado == "UTFPR"
                    ? Colors.yellow.shade200
                    : Colors.blue.shade200,
                title: const Text('Saldo'),
                leading: Radio<Pagar>(
                  fillColor:
                      MaterialStateColor.resolveWith((states) => Colors.black),
                  value: Pagar.saldo,
                  groupValue: _pagar,
                  onChanged: (Pagar? value) {
                    setState(() {
                      _pagar = value;
                    });
                  },
                ),
                trailing: Icon(Icons.savings),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 360.0,
          height: 50.0,
          child: DecoratedBox(
            decoration: yellowBoxDecoration,
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(1)),
            backgroundColor: MaterialStatePropertyAll<Color>(
              widget.mercado == "UTFPR" ? Colors.amber : Colors.blue,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.black),
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Home_Page(
                        mercado: widget.mercado,
                      )),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Pagar',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
