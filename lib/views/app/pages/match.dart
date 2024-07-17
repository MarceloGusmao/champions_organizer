import 'package:flutter/material.dart';

class Match extends StatelessWidget {
  const Match({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Partida'),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Player('Player 1', valor: 7,),

                      SizedBox(height: 16),
                      Figure(width: 100, height: 100,),
                      SizedBox(height: 16),

                      Player('Player 2', valor: 2,),

                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("ROUND 1"),
                      Player('', valor: 2,),

                      SizedBox(height: 16),
                      Figure(width: 40, height: 40, ),
                      SizedBox(height: 16),

                      Player('', valor: 1,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("ROUND 2"),
                      Player('', valor: 2,),

                      SizedBox(height: 16),
                      Figure(width: 40, height: 40, ),
                      SizedBox(height: 16),

                      Player('', valor: 0,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("ROUND 3"),
                      Player('', valor: 3,),

                      SizedBox(height: 16),
                      Figure(width: 40, height: 40, ),
                      SizedBox(height: 16),

                      Player('', valor: 1,),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 40), // Ajusta o preenchimento interno
                      textStyle: TextStyle(fontSize: 24), // Ajusta o tamanho do texto
                      minimumSize: Size(150, 60), // Tamanho mínimo do botão
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Bordas arredondadas
                      ),
                      elevation: 5, // Sombra do botão
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Button in pressed'))
                      );
                    },
                    child: Text('Salvar'),
                  ),
                ],
              ),
            ),
          ],

       ),
      ),
    );
  }
}

class Round extends StatelessWidget {
  const Round({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}



class Player extends StatelessWidget {
  final String texto;
  final double valor;

  Player(this.texto, { required this.valor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(texto, style: TextStyle(
          fontSize: 24,
          color: Colors.black,
        ),),
        Container(
          width: 100,
          height: 100,
          color: Colors.black,
          child: Center(
            child: Text(
              '$valor',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Figure extends StatelessWidget {
  final double width;
  final double height;

  Figure({ required this.width, required this.height});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
      child: Column(
        children: [
          Image.asset("../lib/assets/versus.png",
            width: width, height: height,),
        ],
      ),
    );
  }
}




