import 'package:flutter/material.dart';

Widget linhaResumo(String titulo, String valor) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Row(
      children: [
        Expanded(
          child: Text(titulo),
        ),
        Text(valor),
      ],
    ),
  );
}