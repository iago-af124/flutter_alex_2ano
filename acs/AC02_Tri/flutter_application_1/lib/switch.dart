import 'package:flutter/material.dart';

Widget escolhaSwitch(bool valor, Function(bool) aoMudar) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Switch(
      value: valor,
      onChanged: (novoValor) {
        aoMudar(novoValor);
      },
    ),
  );
} 