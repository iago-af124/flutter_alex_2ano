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
      home: TelaCalc(),
    );
  }
}

class TelaCalc extends StatefulWidget {
  const TelaCalc({super.key});

  @override
  State<TelaCalc> createState() => _TelaCalcState();
}

class _TelaCalcState extends State<TelaCalc> {
  final TextEditingController distancia_viagem = TextEditingController();
  final TextEditingController velocidade_nave = TextEditingController();
  final TextEditingController consumo_combustivel = TextEditingController();
  final TextEditingController quantidade_combustivel = TextEditingController();

  double combustivelNecessario = 0;
  double tempo = 0;
  double combustivelRestante = 0;
  double e = 0;
  String resposta = 'Combustivel restante: 0';
  //TEMPO DE VIAGEM​
  void tempo_viagem() {
    double velocidade = double.tryParse(velocidade_nave.text) ?? 0;
    double distancia = double.tryParse(distancia_viagem.text) ?? 0;

    setState(() {
      tempo = distancia / velocidade;
    });
  }

  //COMBUSTÍVEL NECESSÁRIO​
  void combustivel_necessario() {
    double consumoPorHora = double.tryParse(consumo_combustivel.text) ?? 0;

    setState(() {
      combustivelNecessario = tempo * consumoPorHora;
    });
  }

  //COMBUSTÍVEL RESTANTE​
  void combustivel_restante() {
    double combustivelInicial =
        double.tryParse(quantidade_combustivel.text) ?? 0;

    setState(() {
      combustivelRestante = combustivelInicial - combustivelNecessario;
      if (combustivelRestante <= 0) {
        resposta = 'Combustivel insuficiente para a missão';
      } else {
        resposta = 'Combustivel restante: $combustivelRestante';
      }
    });
  }

  //ENERGIA CINÉTICA DA NAVE​
  void energia_cinetica() {
    int massa = 2000;
    double velocidade = double.tryParse(velocidade_nave.text) ?? 0;
    setState(() {
      e = (massa * (velocidade * velocidade)) / 2;
    });
  }

  void rodar_tudo() {
    tempo_viagem();
    combustivel_necessario();
    combustivel_restante();
    energia_cinetica();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Distância da viagem em quilômetros (km):'),
          TextField(
            controller: distancia_viagem,
            decoration: const InputDecoration(labelText: 'Distância (km)'),
            keyboardType: TextInputType.number,
          ),

          SizedBox(height: 16),

          const Text('Velocidade da nave em quilômetros por hora (km/h):'),
          TextField(
            controller: velocidade_nave,
            decoration: const InputDecoration(labelText: 'Velocidade (km/h)'),
            keyboardType: TextInputType.number,
          ),

          SizedBox(height: 16),

          const Text('Consumo de combustível da nave em litros por hora:'),
          TextField(
            controller: consumo_combustivel,
            decoration: const InputDecoration(labelText: 'Consumo (L/h)'),
            keyboardType: TextInputType.number,
          ),

          SizedBox(height: 16),

          const Text('Quantidade inicial de combustível em litros:'),
          TextField(
            controller: quantidade_combustivel,
            decoration: const InputDecoration(
              labelText: 'Combustível Inicial (L)',
            ),
            keyboardType: TextInputType.number,
          ),

          SizedBox(height: 16),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: tempo_viagem,
                label: const Text('Calcular Tempo Viagem'),
              ),
              ElevatedButton.icon(
                onPressed: combustivel_necessario,
                label: const Text('Calcular Combustivel Necessario'),
              ),
              ElevatedButton.icon(
                onPressed: combustivel_restante,
                label: const Text('Calcular Combustivel Restante'),
              ),
              ElevatedButton.icon(
                onPressed: energia_cinetica,
                label: const Text('Calcular Energia Cinetica'),
              ),
              ElevatedButton.icon(
                onPressed: rodar_tudo,
                label: const Text('Calcular Tudo'),
              ),
            ],
          ),
          Text('Tempo de Viagem: $tempo'),
          Text('Combustivel Necessario: $combustivelNecessario'),
          Text(resposta),
          Text('Energia Cinetica da Nave: $e'),
        ],
      ),
    );
  }
}
