import 'package:flutter/material.dart';

Widget escolhaSlider(double valor, Function(double) aoMudar) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Slider(
      min: 1,
      max: 30,
      divisions: 29,
      value: valor,
      onChanged: (novoValor) {
        aoMudar(novoValor);
      },
    ),
  );
}