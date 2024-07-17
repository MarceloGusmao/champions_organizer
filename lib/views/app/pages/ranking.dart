import 'package:flutter/material.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ExpandableListPage(),
      ),
    );
  }
}

class ExpandableListPage extends StatefulWidget {
  const ExpandableListPage({super.key});

  @override
  CardRanking createState() => CardRanking();
}

class CardRanking extends State<ExpandableListPage> {
  late List<Item> _data;

  @override
  void initState() {
    super.initState();
    _data = generateItems(5);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _data.length,
      itemBuilder: (context, index) {
        return ExpansionPanelList(
          elevation: 1,
          expandedHeaderPadding: const EdgeInsets.all(0),
          expansionCallback: (int panelIndex, bool isExpanded) {
            setState(() {
              _data[index].isExpanded = !_data[index].isExpanded;
            });
          },
          children: [
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(_data[index].headerValue),
                );
              },
              body: Column(
                children:
                    _data[index].expandedValue.map<Widget>((String value) {
                  return Row(children: <Widget>[
                    Expanded(
                      child: Text(
                        'Item ${index + 1}',
                        style: const TextStyle(
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
                        child: const Center(
                          child: Text(
                            '15',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  30.0, // Define o tamanho grande do texto aqui
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ))
                  ]);
                }).toList(),
              ),
              isExpanded: _data[index].isExpanded,
            ),
          ],
        );
      },
    );
  }
}

class Item {
  Item({
    required this.headerValue,
    required this.expandedValue,
    this.isExpanded = false,
  });

  String headerValue;
  List<String> expandedValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Campeonato $index',
      expandedValue: List<String>.generate(5, (int index) => 'Item $index'),
    );
  });
}
