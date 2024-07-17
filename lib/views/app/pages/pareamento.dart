import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PareamentoScreen extends StatelessWidget {
  const PareamentoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildNameColumn('Lucas', 'Miguel'),
              const SizedBox(height: 40),
              _buildNameColumn('Roberto', 'Marcos'),
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
