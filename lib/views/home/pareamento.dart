import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:champions_organizer/routes/app_routes.dart';

import 'home.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Names Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NamesPage(),
      routes: {
        '/home': (context) => MyHomePage(),
      },
    );
  }
}

class NamesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PAREAMENTO', // Título da AppBar
          style: GoogleFonts.lato(
            // Aplicando estilo da fonte
            textStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true, // Centralizando o título na AppBar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildNameColumn('Lucas', 'Miguel'),
              SizedBox(height: 40),
              _buildNameColumn('Roberto', 'Marcos'),
              SizedBox(height: 30),
              SizedBox(height: 200),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Text(
                  'Voltar',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNameColumn(String name1, String name2) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Colors.blueAccent,
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$name1 X $name2', // Inclui o "X" separando os nomes
            style: GoogleFonts.lato(
              textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
