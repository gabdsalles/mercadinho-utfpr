import 'package:flutter/material.dart';
import 'package:projeto_mercadinho/pages/cadastrar.dart';
import 'package:projeto_mercadinho/pages/merc_home.dart';
import 'package:projeto_mercadinho/pages/recuperar_senha.dart';

class Login extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _senha = TextEditingController();

  logar() {
    if (_form.currentState!.validate()) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Mercadinho Universitário'),
        ),
        leading: Image.asset('images/abelha.png'),
        backgroundColor: Colors.yellow,
      ),
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset('images/abelha.png'),
                  width: 200,
                ),
              ],
            ),
          ),
          Form(
            key: _form,
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 300,
                  child: TextFormField(
                    controller: _email,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20.0),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo de Email em branco !';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  height: 100,
                  width: 300,
                  child: TextFormField(
                    controller: _senha,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20.0),
                      filled: true, //<-- SEE HERE
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      labelText: 'Senha',
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo de Senha em branco !';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(top: 16),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                  Colors.amber,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              onPressed: () {
                bool a = logar();
                if (a) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Login realizado com sucesso!')),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MercHome()),
                  );
                } else {
                  return null;
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      Colors.yellow,
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
                      MaterialPageRoute(builder: (context) => Cadastrar()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Cadastrar',
                          style: TextStyle(fontSize: 10),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 95),
                margin: EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      Colors.yellow,
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
                          builder: (context) => Recuperar_Senha()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Recuperar Senha',
                          style: TextStyle(fontSize: 10),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      backgroundColor: Colors.yellow,
    );
  }
}
