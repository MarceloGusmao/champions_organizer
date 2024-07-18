import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../services/jogadores_service.dart';

class PareamentoScreen extends StatelessWidget {
  const PareamentoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: FutureBuilder<List<String>>(
            future: fetchJogadoress(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text('No players found');
              } else {
                List<String> names = snapshot.data!;
                return ListView.builder(
                  itemCount: names.length ~/ 2,
                  itemBuilder: (context, index) {
                    int i = index * 2;
                    String name1 = names[i];
                    String name2 = (i + 1 < names.length) ? names[i + 1] : '';
                    return Column(
                      children: [
                        _buildNameColumn(name1, name2),
                        SizedBox(height: 40),
                      ],
                    );
                  },
                );
              }
            },
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
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$name1 X $name2', // Inclui o "X" separando os nomes
            style: GoogleFonts.lato(
              textStyle:
              const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}