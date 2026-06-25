import 'package:flutter/material.dart';
import 'widgets/text_field.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MinhaTela(),
    );
  }
}
class MinhaTela extends StatelessWidget{
  const MinhaTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Roger é legal hahaha'),),
      body: Column(
        children: [
          Text('Roger michael jackson 2'),
          meuTextField('Nome', Icons.person),
          meuTextField('Email', Icons.email),
          meuTextField('Senha', Icons.lock,senha: true)
        ],
      ),
    );
  }
}