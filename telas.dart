//TRABALHO DE LINGUAGEM - AGENDA DE CONTATOS
//Ana Julia Mendonça de Morais
//Gabrielly Laborda Batista
//Wenddy Naelly Cruz Pimentel


import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Contato {
  String nome;
  String telefone;
  String email;

  Contato({required this.nome, required this.telefone, required this.email});
}

class Home extends StatelessWidget {
  static List<Contato> contatos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/icon.png"),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProximaTela()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(248, 44, 57, 243),
                ),
                child: Text('Novo contato', style: TextStyle(fontSize: 38)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TelaContatos(contatos: contatos)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(248, 44, 57, 243),
                ),
                child: Text('Contatos', style: TextStyle(fontSize: 38)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProximaTela extends StatefulWidget {
  @override
  AddContactScreen createState() => AddContactScreen();
}

class AddContactScreen extends State<ProximaTela> {
  String nome = '';
  String telefone = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(248, 51, 54, 98),
        title: Text('Adicionar Contato'),
      ),
      body: Container(
        color: Color.fromARGB(215, 205, 208, 255),
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage("assets/images/iconn.png"),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Nome:'),
                onChanged: (value) {
                  setState(() {
                    nome = value;
                  });
                },
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Telefone:'),
                onChanged: (value) {
                  setState(() {
                    telefone = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Email:'),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Contato newContato =
                      Contato(nome: nome, telefone: telefone, email: email);
                  Home.contatos.add(newContato);
                  print(
                      'Tamanho da Lista de Contatos: ${Home.contatos.length}');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TelaContatos(contatos: Home.contatos)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(248, 41, 54, 98),
                ),
                child: Text('Adicionar Contato',
                    style: TextStyle(fontSize: 17)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TelaContatos extends StatelessWidget {
  final List<Contato> contatos;

  TelaContatos({required this.contatos});

  @override
  Widget build(BuildContext context) {
    print('TelaContatos construída');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(248, 51, 54, 98),
        centerTitle: true,
        title: Text('Contato', style: TextStyle(fontSize: 25)),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.gradient,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < contatos.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nome: ${contatos[i].nome}'),
                    Text('Telefone: ${contatos[i].telefone}'),
                    Text('E-mail: ${contatos[i].email}'),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        contatos.removeAt(i);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TelaContatos(contatos: contatos)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      child: Text('Excluir Contato',
                          style: TextStyle(fontSize: 17)),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppGradients {
  static Gradient get gradient => LinearGradient(
        colors: [
          Color.fromARGB(255, 215, 205, 208),
          Color.fromARGB(255, 205, 208, 255),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
}
