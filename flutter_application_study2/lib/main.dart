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
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Meu app',
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Alex',
                style: TextStyle(
                  fontSize: 40,
                  color: Color.fromARGB(255, 255, 0, 221),
                  fontFamily: 'Arial'
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'Alex Esta na FIAP',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Arial',
                  fontStyle: FontStyle.italic
                ),
              )
            ], 
          )
        ),
      ),
    );
  }
}
