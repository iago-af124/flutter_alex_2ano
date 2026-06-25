import 'package:flutter/material.dart';

Widget escolhaCheckbox(bool valor, Function(bool) aoMudar) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Checkbox(
      value: valor,
      onChanged: (novoValor) {
        aoMudar(novoValor!);
      },
    ),
  );
}