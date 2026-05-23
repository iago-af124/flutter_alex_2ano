import 'package:flutter/material.dart';

Widget addcoisa(String texto, TextEditingController controller){
  return Padding(
    padding: EdgeInsets.all(10),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: texto,
        border: OutlineInputBorder()
      ),
    ),
  );
}