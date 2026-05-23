import 'package:flutter/material.dart';

Widget botao(VoidCallback funcao,String texto){
  return Padding(
    padding: EdgeInsets.all(10),
    child: ElevatedButton(
      onPressed: funcao, child: Text(texto)
    )
  );
}