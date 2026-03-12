import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text(
            'Meu primeiro APP',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello World!',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arial',
                ),
              ),
              SizedBox(height: 20),
              Text(
                'FIAP School',
                style: TextStyle(
                  fontSize: 28,
                  color: Color.fromARGB(255, 239, 4, 145),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arial',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
