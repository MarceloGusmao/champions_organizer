import 'package:champions_organizer/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'pareamento.dart';
import 'ranking.dart';
import 'match.dart';
import 'status_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<HomeScreen> {
  int _selectedIndex = 0;
  ParseUser? currentUser;

  @override
  void initState() {
    super.initState();
    fetchCurrentUser();
  }

  Future<void> fetchCurrentUser() async {
    ParseUser? user = await AuthService.getCurrentUser();
    setState(() {
      currentUser = user;
    });
  }

  static const List<String> _titles = [
    'Perfil',
    'Partida',
    'Pareamento',
    'Ranking'
  ];

//Aqui colocar os widget depois de ter logado

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _logout() async {
    final bool response = await AuthService.logout();
    if (response) {
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentUser == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Loading...'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    List<Widget> _widgetOptions = <Widget>[
      StatusScreen(user: currentUser!),
      Match(),
      PareamentoScreen(),
      RankingScreen()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(currentUser!.username ?? ''),
              accountEmail: Text(currentUser!.emailAddress ?? ''),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'SN',
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                _logout();
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/background_app.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_esports),
            label: 'Partida',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bluetooth),
            label: 'Pareamento',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.trophy),
            label: 'Ranking',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
