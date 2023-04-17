import 'package:flutter/material.dart';
import 'package:projeto_mercadinho/pages/login.dart';




class Cadastrar extends StatelessWidget {

  //final  dropValue = ValueNotifier('');
  //final dropOpcoes = ['Alterar dados da conta', 'Adicionar saldo', 'Sair'];
  
  final _form = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _senha = TextEditingController();
  final _confirmarSenha = TextEditingController();
  final _nome = TextEditingController();
  final _ra = TextEditingController();
  final _curso = TextEditingController();
  final _imagem = TextEditingController();





  cadastrar(){
    if(_form.currentState!.validate()){
      return true;
    } 
    return false;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(             
          title: 
            Center(
              child: Text('Cadastrar'),
            ),
          leading: Image.asset('images/abelha.png'),
          backgroundColor: Colors.yellow,          
        ),
    
       body: 
        ListView(
          padding:EdgeInsets.all(24) ,  
            children: [
              Form(
                key: _form,
                child: 
                  Column(
                    children:[
                      Padding(
                        padding: EdgeInsets.only(bottom:24),
                        child: 
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                          ),
                      ),  
                      Container(
                        height: 75,
                        width: 300,
                        child : 
                          new TextFormField(
                            controller: _nome,
                            style: 
                              TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              decoration: 
                                InputDecoration(
                                  contentPadding: 
                                    EdgeInsets.all(20.0),  
                                    filled: true, 
                                    fillColor: Colors.white, 
                                  border: 
                                    OutlineInputBorder(
                                      borderSide: BorderSide(color:Colors.black),
                                      borderRadius: BorderRadius.circular(60),
                                    ),
                                    labelText: 'Nome',
                                ),
                                keyboardType: TextInputType.name,
                                validator: (value){
                                  if(value!.isEmpty)
                                  {
                                    return 'Campo de Nome em branco !';
                                  }
                                  return null;
                                },
                            ),
                        ),

                        Container(
                          height: 75,
                          width: 300,
                          child : 
                            TextFormField(
                              controller: _ra,
                              style: 
                                TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              decoration: 
                                InputDecoration(
                                  contentPadding: 
                                    EdgeInsets.all(20.0),  
                                    filled: true, 
                                    fillColor: Colors.white, 
                                  border: 
                                    OutlineInputBorder(
                                      borderSide: BorderSide(color:Colors.black),
                                      borderRadius: BorderRadius.circular(60),
                                    ),
                                    labelText: 'Ra',
                                ),
                                keyboardType: TextInputType.text,
                                validator: (value){
                                  if(value!.isEmpty)
                                  {
                                    return 'Campo de Ra em branco !';
                                  }
                                  return null;
                                },
                            ),
                        ), 

                        Container(
                          height: 75,
                          width: 300,
                          child : 
                            TextFormField(
                              controller: _curso,
                              style: 
                                TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              decoration: 
                                InputDecoration(
                                  contentPadding: 
                                    EdgeInsets.all(20.0),  
                                    filled: true, 
                                    fillColor: Colors.white, 
                                  border: 
                                    OutlineInputBorder(
                                      borderSide: BorderSide(color:Colors.black),
                                      borderRadius: BorderRadius.circular(60),
                                    ),
                                    labelText: 'Curso',
                                ),
                                keyboardType: TextInputType.text,
                                validator: (value){
                                  if(value!.isEmpty)
                                  {
                                    return 'Campo de Curso em branco !';
                                  }
                                  return null;
                                },
                            ),
                        ), 

                        Container(
                          height: 75,
                          width: 300,
                          child : 
                            TextFormField(
                              controller: _email,
                              style: 
                                TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              decoration: 
                                InputDecoration(
                                  contentPadding: 
                                    EdgeInsets.all(20.0),  
                                    filled: true, 
                                    fillColor: Colors.white, 
                                  border: 
                                    OutlineInputBorder(
                                      borderSide: BorderSide(color:Colors.black),
                                      borderRadius: BorderRadius.circular(60),
                                    ),
                                    labelText: 'Email',
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value){
                                  if(value!.isEmpty)
                                  {
                                    return 'Campo de Email em branco !';
                                  }
                                  return null;
                                },
                            ),
                        ),      

                      Container(
                        height: 75,
                        width: 300,
                        child : 
                          TextFormField(
                            controller: _senha,
                            style: 
                              TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              decoration: 
                                InputDecoration(
                                  contentPadding: 
                                    EdgeInsets.all(20.0),  
                                    filled: true, 
                                    fillColor: Colors.white, 
                                  border: 
                                    OutlineInputBorder(
                                      borderSide: BorderSide(color:Colors.black),
                                      borderRadius: BorderRadius.circular(60),
                                    ),
                                    labelText: 'Senha',
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value){
                                  if(value!.isEmpty)
                                  {
                                    return 'Campo de Senha em branco !';
                                  }
                                  return null;
                                },
                            ),
                        ),
                        
                        Container(
                          height: 75,
                          width: 300,
                          child : 
                            TextFormField(    
                              controller: _confirmarSenha,
                              style: 
                                TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                decoration: 
                                  InputDecoration(
                                    contentPadding: EdgeInsets.all(20.0),
                                    filled: true, //<-- SEE HERE
                                    fillColor: Colors.white,
                                    border: 
                                      OutlineInputBorder(
                                        borderSide: BorderSide(color:Colors.black),
                                        borderRadius: BorderRadius.circular(60),
                                      ),
                                      labelText: 'Confirmar Senha',
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  validator: (value){
                                    if(value!.isEmpty)
                                    {
                                      return 'Campo de Confirmar Senha em branco !';
                                    }
                                    return null;
                                  },
                              ),
                           ),
                        
                          Container(
                            height: 75,
                            width: 300,
                            child : 
                              TextFormField( 
                                controller: _imagem,   
                                style: 
                                  TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                decoration: 
                                  InputDecoration(
                                    contentPadding: EdgeInsets.all(20.0),
                                    filled: true, //<-- SEE HERE
                                    fillColor: Colors.white,
                                    border: 
                                      OutlineInputBorder(
                                        borderSide: BorderSide(color:Colors.black),
                                        borderRadius: BorderRadius.circular(60),
                                      ),
                                      labelText: 'Imagem',
                                  ),
                                  keyboardType: TextInputType.url,
                                  
                              ),
                           ),
                    ],
                  ),
              ),
                   
              Container(
                width: 250,
                alignment: Alignment.bottomCenter,
                child: 
                  ElevatedButton(
                    style:  
                    ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.amber,),
                      shape: 
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                    ),
                    onPressed:  () {
                      bool a = cadastrar();
                      if(_senha.value == _confirmarSenha.value)
                      {
                        if(a)
                        {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Cadastro realizado com sucesso!')),
                          );
                        
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                          );
                        }
                        else {
                          return null;
                        } 
                      }
                      else
                      {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('As senhas não são iguais')),
                        );
                        
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Cadastrar()),
                        );
                      } 
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.all(16),
                          child: Text(
                            'Cadastrar',
                            style: 
                              TextStyle(fontSize: 20),
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
                    MaterialPageRoute(builder: (context) => Login()),
                    );
                
        },
        child: Icon(Icons.arrow_back),        
        backgroundColor: Colors.amber,
        shape: RoundedRectangleBorder(side: BorderSide(width: 1,color: Colors.black),borderRadius: BorderRadius.circular(100)),
        
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,


        backgroundColor: Colors.yellow,
    );
  }
}
