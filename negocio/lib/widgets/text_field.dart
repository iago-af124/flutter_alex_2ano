import 'package:flutter/material.dart';

Widget meuTextField(String texto, IconData icone, {bool senha=false}){
  return Padding(
    padding: EdgeInsetsGeometry.all(10),
    child:TextField(
            obscureText: senha,
            decoration: InputDecoration(
              labelText: texto,
              prefixIcon: Icon(icone),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
          ),
  );
}
