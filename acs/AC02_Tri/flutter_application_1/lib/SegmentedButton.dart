import 'package:flutter/material.dart';

Widget escolhaVeiculo(String opcao, Function(String) carroSelecao) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: SegmentedButton(
      segments: const [
        ButtonSegment(value: "120", label: Text('Econômico')),
        ButtonSegment(value: "180", label: Text('SUV')),
        ButtonSegment(value: "300", label: Text('Luxo')),
      ],
      selected: {opcao},
      onSelectionChanged: (selec) {
        carroSelecao(selec.first);
      },
    ),
  );
}