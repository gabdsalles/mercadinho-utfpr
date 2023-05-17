import 'package:flutter/material.dart';
import 'package:projeto_mercadinho/pages/login_page.dart';

// ignore: camel_case_types
class Recuperar_Senha_Page extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  recuperar() {
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
          child: Text('Recuperar Senha'),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
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
                  child: Text(
                    'Insira seu email e ra para receber a sua nova senha.',
                    style: TextStyle(fontSize: 15),
                  ),
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
                      labelText: 'Ra',
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo de Ra em branco !';
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
                bool a = recuperar();
                if (a) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Solicitação enviada')),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login_Page()),
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
                      'Confirmar',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login_Page()),
          );
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.amber,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(100)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      backgroundColor: Colors.yellow.shade200,
    );
  }
}
