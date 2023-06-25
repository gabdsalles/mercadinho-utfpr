// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:projeto_mercadinho/repositories/cadastro_repository.dart';
import 'package:provider/provider.dart';
import '../models/cadastrar.dart';
import 'package:image_picker/image_picker.dart';

class Cadastrar_Page extends StatefulWidget {
  @override
  _Cadastrar_PageState createState() => _Cadastrar_PageState();
}

class _Cadastrar_PageState extends State<Cadastrar_Page> {
  late CadastroRepository cadastro;
  final _form = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _senha = TextEditingController();
  final _confirmarSenha = TextEditingController();
  final _nome = TextEditingController();
  final _ra = TextEditingController();
  final _curso = TextEditingController();
  File? _imagem;
  bool _isPasswordVisible = false;
  double borda = 25.0;

  Future<void> cadastrarUser(Cadastrar cadastrar, BuildContext context) async {
    if (_form.currentState!.validate()) {
      if (_imagem != null) {
        List<int> imageBytes = await _imagem!.readAsBytes();
        String base64Image = base64Encode(imageBytes);
        cadastrar.imagem = base64Image;
        //print("A imagem foi codificada: " + base64Image);
      }
      cadastro.adicionarCadastro(cadastrar, context);
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      final imageFile = File(pickedImage.path);
      setState(() {
        _imagem = imageFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    cadastro = context.watch<CadastroRepository>();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Cadastrar'),
        ),
        backgroundColor: Colors.yellow.shade400,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Form(
            key: _form,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Selecionar Imagem'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                GestureDetector(
                                  child: Text('Galeria'),
                                  onTap: () {
                                    _pickImage(ImageSource.gallery);
                                    Navigator.of(context).pop();
                                  },
                                ),
                                SizedBox(height: 16),
                                GestureDetector(
                                  child: Text('Câmera'),
                                  onTap: () {
                                    _pickImage(ImageSource.camera);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Ícone de câmera
                        Positioned(
                          top: 55,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey,
                            size: 70,
                          ),
                        ),
                        // Imagem selecionada
                        _imagem == null
                            ? SizedBox.shrink()
                            : ClipOval(
                                child: Image.file(
                                  _imagem!,
                                  fit: BoxFit.cover,
                                  width: 180,
                                  height: 180,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  height: 75,
                  width: 300,
                  child: new TextFormField(
                    controller: _nome,
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
                        borderRadius: BorderRadius.circular(borda),
                      ),
                      labelText: 'Nome',
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(Icons.person),
                      ),
                    ),
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo de Nome em branco!';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  height: 75,
                  width: 300,
                  child: TextFormField(
                    controller: _ra,
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
                        borderRadius: BorderRadius.circular(borda),
                      ),
                      labelText: 'RA',
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(Icons.school),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo de RA em branco!';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  height: 75,
                  width: 300,
                  child: TextFormField(
                    controller: _curso,
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
                        borderRadius: BorderRadius.circular(borda),
                      ),
                      labelText: 'Curso',
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(Icons.book),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo de Curso em branco!';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  height: 75,
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
                        borderRadius: BorderRadius.circular(borda),
                      ),
                      labelText: 'Email',
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(Icons.email),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo de Email em branco!';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  height: 75,
                  width: 300,
                  child: TextFormField(
                    obscureText: !_isPasswordVisible,
                    controller: _senha,
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
                        borderRadius: BorderRadius.circular(borda),
                      ),
                      labelText: 'Senha',
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(Icons.lock),
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                          child: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo de Senha em branco!';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  height: 75,
                  width: 300,
                  child: TextFormField(
                    obscureText: !_isPasswordVisible,
                    controller: _confirmarSenha,
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
                        borderRadius: BorderRadius.circular(borda),
                      ),
                      labelText: 'Confirmar Senha',
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(Icons.lock),
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                          child: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo de Confirmar Senha em branco!';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 300,
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        Colors.amber.shade300,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borda),
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (_senha.text == _confirmarSenha.text) {
                        Cadastrar cadastrar = Cadastrar(
                          nome: _nome.text,
                          ra: _ra.text,
                          curso: _curso.text,
                          email: _email.text,
                          senha: _senha.text,
                          imagem: _imagem != null
                              ? base64Encode(_imagem!.readAsBytesSync())
                              : null,
                          log: 0,
                          saldo: 0.0,
                          numero: 0,
                        );
                        cadastrarUser(cadastrar, context);
                      } else {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('As senhas não são iguais')),
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'Cadastrar',
                            style: TextStyle(fontSize: 25),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.yellow.shade100,
    );
  }
}
