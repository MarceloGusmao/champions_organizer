import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class StatusScreen extends StatelessWidget {
  final ParseUser user;
  StatusScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(user.username ?? "",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600))),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: ListView(
            children: const [
              SizedBox(height: 16.0),
              ExpandableListPage(),
              SizedBox(height: 16.0),
            ],
          ),
        ),
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
    _data = generateItems();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _data.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withOpacity(0.5)),
          ),
          child: ExpansionPanelList(
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
                  return Container(
                    color: Colors.black,
                    child: ListTile(
                      title: Center(
                        child: Text(
                          _data[index].headerValue,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  );
                },
                body: Column(
                  children: _data[index]
                      .expandedValue
                      .map<Widget>((ItemDetail detail) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Text(detail.title,
                                style: const TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600)),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Center(
                                child: Text(detail.points,
                                    style: const TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.black,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                isExpanded: _data[index].isExpanded,
              ),
            ],
          ),
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
  List<ItemDetail> expandedValue;
  bool isExpanded;
}

class ItemDetail {
  ItemDetail({required this.title, required this.points});

  String title;
  String points;
}

List<Item> generateItems() {
  return [
    Item(
      headerValue: 'PARTIDA 1',
      expandedValue: [
        ItemDetail(title: 'MISSION POINTS', points: '20'),
        ItemDetail(title: 'VICTORY POINTS', points: '25'),
        ItemDetail(title: 'ROUND 1', points: '10 X 10'),
        ItemDetail(title: 'ROUND 2', points: '10 X 10'),
        ItemDetail(title: 'ROUND 3', points: '10 X 10'),
      ],
    ),
    Item(
      headerValue: 'PARTIDA 2',
      expandedValue: [
        ItemDetail(title: 'MISSION POINTS', points: '26'),
        ItemDetail(title: 'VICTORY POINTS', points: '20'),
      ],
    ),
    Item(
      headerValue: 'PARTIDA 3',
      expandedValue: [
        ItemDetail(title: 'MISSION POINTS', points: '30'),
        ItemDetail(title: 'VICTORY POINTS', points: '28'),
      ],
    ),
    Item(
      headerValue: 'PARTIDA 4',
      expandedValue: [
        ItemDetail(title: 'MISSION POINTS', points: '22'),
        ItemDetail(title: 'VICTORY POINTS', points: '19'),
      ],
    ),
  ];
}
