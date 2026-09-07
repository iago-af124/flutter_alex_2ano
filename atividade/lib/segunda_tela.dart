import 'package:flutter/material.dart';

class segunda_tela extends StatefulWidget {
  const segunda_tela({super.key});

  @override
  State<segunda_tela> createState() => _segunda_tela();
}

class _segunda_tela extends State<segunda_tela> {
  final TextEditingController nome_hotel = TextEditingController();
  final TextEditingController diarias = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
          ],
        ),
      ),
    );
  }
}