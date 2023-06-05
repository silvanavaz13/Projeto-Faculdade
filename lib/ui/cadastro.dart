import 'package:cadastro/ui/home.dart';
import 'package:flutter/material.dart';



class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _usuarioController = new TextEditingController();
  final TextEditingController _senhaController = new TextEditingController();
  String _bemvindo = "Bem-Vindo";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            //Cadastro/ formulario
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _usuarioController,
                      decoration: InputDecoration(
                        hintText: 'E-mail',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.5)),
                        icon: Icon(Icons.person)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _senhaController,
                      decoration: InputDecoration(
                        hintText: 'Senha',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.5)),
                        icon: Icon(Icons.key_outlined)
                      ),
                      obscureText: true,
                    ),
                  ),
                  //Botão
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //RecuperarSenha
                        Container(
                          height: 40,
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {  },
                            child: Text(
                              "Esqueceu Senha",
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                        ),
                        //Entrar
                        Container(
                           margin: (EdgeInsets.only(top: 10, left: 25, right: 25)),
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(32))),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context, Home() as Route<Home>,);
                            },
                            child: Center(
                              child: Text(
                                'ENTRAR',
                                style: TextStyle(color: Colors.white),
                              )
                            ),
                          ),
                  ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //Text
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    " $_bemvindo",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 19.6,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}


