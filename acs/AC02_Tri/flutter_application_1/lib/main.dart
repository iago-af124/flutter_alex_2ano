import 'package:flutter/material.dart';
import 'SegmentedButton.dart';
import 'checkbox.dart';
import 'slider.dart';
import 'switch.dart';
import 'linharesumo.dart';

void main() {
  runApp(const app());
}

// kaique passou por aqui🙂
class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Roger is coming',
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key}); //se vc notar que usar const varias vezes é q n sei pq mas meu flutter ta dando como erro n sei pq se eu tiver menos é pq consertei

  @override
  State<Home> createState() => _home();
}

class _home extends State<Home> {
  String opcao = '120';
  bool _selecionadoseguro = false;
  bool _selecionadogps = false;
  bool motorista = false;
  double dias = 1;
  double motoristaValor = 100.0;

  void carroselecao(String novaOpcao) {
    setState(() {
      opcao = novaOpcao;
    });
  }

  void checkboxseguro(bool selecionadoseguro) {
    setState(() {
      _selecionadoseguro = selecionadoseguro;
    });
  }

  void checkboxgps(bool selecionadogps) {
    setState(() {
      _selecionadogps = selecionadogps;
    });
  }

  void alterarMotorista(bool novoValor) {
    setState(() {
      motorista = novoValor;
    });
  }

  void alterarDias(double novoValor) {
    setState(() {
      dias = novoValor;
    });
  }

  String textoBool(bool valor) {
    if (valor) {
      return 'Sim';
    } else {
      return 'Não';
    }
  }

  double valorVeiculo() {
    return double.parse(opcao);
  }

  String nomeVeiculo() {
    if (opcao == '120') {
      return 'Carro Econômico';
    } else if (opcao == '180') {
      return 'SUV';
    } else {
      return 'Carro de Luxo';
    }
  }

  double valorDiario() {
    double totalDia = valorVeiculo();

    if (_selecionadoseguro) {
      totalDia += 40;
    }

    if (_selecionadogps) {
      totalDia += 15;
    }

    return totalDia;
  }

  double valorBruto() {
    double bruto = valorDiario() * dias;

    if (motorista) {
      bruto += motoristaValor;
    }

    return bruto;
  }

  double percentualDesconto() {
    if (dias >= 15) {
      return 0.10;
    } else if (dias >= 7) {
      return 0.05;
    } else {
      return 0.0;
    }
  }

  double valorDesconto() {
    return valorBruto() * percentualDesconto();
  }

  double valorFinal() {
    return valorBruto() - valorDesconto();
  }

  String categoriaCliente() {
    double total = valorFinal();

    if (total <= 1000) {
      return 'Cliente Bronze';
    } else if (total <= 3000) {
      return 'Cliente Prata';
    } else if (total <= 5000) {
      return 'Cliente Ouro';
    } else {
      return 'Cliente Platinum';
    }
  }

  void mostrarDialogoReserva() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Resumo da Reserva'),
          content: SingleChildScrollView( //usei isso para que a tela possa descer ou seja rolavel aprendi com Pachu :) to usando em tudo ent usei nesse pra evitar problema
            child: Text(
              'Veículo escolhido: ${nomeVeiculo()}\n'
              'Quantidade de dias: ${dias.toInt()}\n'
              'Seguro: ${textoBool(_selecionadoseguro)}\n'
              'GPS: ${textoBool(_selecionadogps)}\n'
              'Motorista adicional: ${textoBool(motorista)}\n'
              'Valor bruto: $valorBruto\n'
              'Desconto: $valorDesconto\n'
              'Valor final: $valorFinal\n'
              'Categoria: ${categoriaCliente()}',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Reserva realizada com sucesso!'),
                  ),
                );
              },
              child: Text('Confirmar Reserva'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double bruto = valorBruto();
    double desconto = valorDesconto();
    double finalLocacao = valorFinal();

    return Scaffold(
      appBar: AppBar(
        title: Text('Locadora de Veículos'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView( //usei isso para que a tela possa descer ou seja rolavel aprendi com Pachu :)
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text('Escolha do Veículo'),
                escolhaVeiculo(opcao, carroselecao),

                Text('Seguro Completo'),
                escolhaCheckbox(_selecionadoseguro, checkboxseguro),

                Text('GPS'),
                escolhaCheckbox(_selecionadogps, checkboxgps),

                Text('Motorista Adicional'),
                escolhaSwitch(motorista, alterarMotorista),

                Text("Quantidade de Dias: ${dias.toInt()}"),
                escolhaSlider(dias, alterarDias),

                SizedBox(height: 20),

                Text('Resumo da Locação'),

                linhaResumo('Veículo escolhido:', nomeVeiculo()),
                linhaResumo('Quantidade de dias:', dias.toInt().toString()), //usei isso pra teste mesmo colocar {} iria funcionar mas achei legal e coloquei eles só coloca comos tring
                linhaResumo('Seguro:', textoBool(_selecionadoseguro)),
                linhaResumo('GPS:', textoBool(_selecionadogps)),
                linhaResumo('Motorista adicional:', textoBool(motorista)),
                linhaResumo('Valor bruto:', '$bruto'),
                linhaResumo('Desconto:', '$desconto'),
                linhaResumo('Valor final:', '$finalLocacao'),
                linhaResumo('Categoria:', categoriaCliente()),

                SizedBox(height: 20),

                SizedBox(
                  child: ElevatedButton(
                    onPressed: mostrarDialogoReserva,
                    child: Text('Finalizar Reserva'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}