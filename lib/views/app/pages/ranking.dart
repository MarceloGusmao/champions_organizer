import 'package:flutter/material.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CardRanking(numberOfItems: 10), // Passe o número de itens aqui
      ),
    );
  }
}

class CardRanking extends StatelessWidget {
  final int numberOfItems;

  CardRanking({required this.numberOfItems});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: numberOfItems,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.blueAccent[50],
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Colors.black, // Cor da borda
              width: 3.0, // Largura da borda
            ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Item ${index + 1}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.redAccent,
                child: Center(
                  child: Text(
                    '15',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0, // Define o tamanho grande do texto aqui
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
