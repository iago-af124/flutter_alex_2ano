import 'package:flutter/material.dart';

Widget escolhaVeiculo(
  double opcao,
  Function(double) carroSelecao,
) {
  return SegmentedButton<double>(
    segments: const [
      ButtonSegment(value: 120, label: Text('Econômico')),
      ButtonSegment(value: 180, label: Text('SUV')),
      ButtonSegment(value: 300, label: Text('Luxo')),
    ],
    selected: {opcao},
    onSelectionChanged: (selec) {
      carroSelecao(selec.first);
    },
  );
}