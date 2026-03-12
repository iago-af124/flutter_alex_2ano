import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(180, 123, 178, 1),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Olá, Pessoal!',
              style: TextStyle(
                fontSize: 80,
                color: Colors.deepOrange
              ) ),
              
              SizedBox(height: 10,),
              
              Text('Estudando Flutter',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 35,
                fontStyle: FontStyle.italic
              ),),
              
              SizedBox(height: 10,),
              
              Text('Bora Codar',
              style: TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.bold,
                fontSize: 80
              ),),
              
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Jogos',
                  style: TextStyle(fontSize: 100, color: Colors.pinkAccent),),
                  SizedBox(width: 30,),
                  Text('Musica', style: TextStyle(fontSize: 60, color: Colors.blueAccent),),
                  SizedBox(width: 30,),
                  Text('Series', style: TextStyle(fontSize: 40, color: Colors.pinkAccent),),
                ],
              ),

              SizedBox(height: 10,),
              Text('2026 - Vamos nessa!', style: TextStyle(
                fontFamily: 'poppins',
                fontWeight: FontWeight.w900,
                fontSize: 80,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
