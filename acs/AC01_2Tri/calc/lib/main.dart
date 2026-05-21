import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //void _incrementCounter() {
    //setState(() {
      //_counter++;
    //});
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('AC01 - Alexandre'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(5),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  label: Text('1. Valor Inicial'),
                  border: OutlineInputBorder()
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('2. Aporte Mensal'),
                  border: OutlineInputBorder()
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('3. Taxa de Juros (%)'),
                  border: OutlineInputBorder()
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('4. Quantidade de Meses'),
                  border: OutlineInputBorder()
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('5. Meta Financeira'),
                  border: OutlineInputBorder()
                ),
              ),
            ],
          ),
        ),
        ),
      );
  }
}
