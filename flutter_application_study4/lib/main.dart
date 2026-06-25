import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TelaCalculadora());
  }
}

class TelaCalculadora extends StatefulWidget {
  const TelaCalculadora({super.key});
  @override
  State<TelaCalculadora> createState() => _TelaCalculadoraState();
}

class _TelaCalculadoraState extends State<TelaCalculadora> {
  final TextEditingController numero1Controller = TextEditingController();
  final TextEditingController numero2Controller = TextEditingController();
  double resultado = 0;

  void somar() {
    double n1 = double.tryParse(numero1Controller.text) ?? 0;
    double n2 = double.tryParse(numero2Controller.text) ?? 0;
    setState(() {
      resultado = n1 + n2;
    });
  } //somar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora PRO'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: numero1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite seu numero bobao',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: numero2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite seu segundo numero bobao',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30,),
            ElevatedButton(
              onPressed: somar, 
              child: const Text('Somar'),
            ),
            Text('10 casadas a 1km de distancia de sua casa', 
            style: TextStyle(color: Colors.red),),
            const SizedBox(height: 30,),
            Text('Resultado: $resultado', 
            style: TextStyle(color: Colors.amberAccent, fontSize: 50),),
          ],
        ),
      ),
    );
  }
}//_TelaCalculadoraState