import 'package:flutter/material.dart';

import 'segunda_tela.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
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
  final TextEditingController nome_hotel = TextEditingController();
  final TextEditingController diarias = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            //Nome do Hotel
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder(), labelText:'Nome do Hotel'),
              controller: nome_hotel,
            ),
            //Diarias
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Diarias'),
              controller: diarias,
            ),
            ElevatedButton(
              child: Image.asset('assets/verity.png', width: 250, height: 250,),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const segunda_tela(
                    nome: nome_hotel
                  )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
