import 'dart:math' as math;
import 'package:calc/custom_button.dart';
import 'package:flutter/material.dart';
import 'custom_textfield.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alexapp',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _MetaController = TextEditingController();
  final TextEditingController _MesesController = TextEditingController();
  final TextEditingController _TaxaController = TextEditingController();
  final TextEditingController _AporteMensalController = TextEditingController();
  final TextEditingController _ValorInicialController = TextEditingController();

  double taxa = 0;
  double lucro = 0;
  double total_investido = 0;
  double montanteFinal = 0;
  double meta = 0;
  double mf = 0;
  String msgmeta = '';
  String perfil = '';

  void msg(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Simulação realizada com sucesso'),
        duration: const Duration(seconds: 8),
      )
    );
  }

  void msg2(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Dados removidos com sucesso'),
        duration: const Duration(seconds: 8),
      )
    );
  }

  void msg3(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Dados de exemplo carregados'),
        duration: const Duration(seconds: 8),
      )
    );
  }

  void addexemplo(){
      _AporteMensalController.text = '1000';
      _MesesController.text = '500';
      _MetaController.text = '1.2';
      _TaxaController.text = '24';
      _ValorInicialController.text = '30000';
  }

  void limparDados(){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text('Gostaria de remover tudo??'),
          content: Text('Aperte um desses pra remover ou nao'),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, 
            child: const Text('Cancelar')),
            TextButton(onPressed: (){
              limpar();
              msg2();
              Navigator.pop(context);
            }, 
            child: const Text('Limpar')),
            TextButton(onPressed: (){
              addexemplo();
              msg3();
              Navigator.pop(context);
            }, 
            child: const Text('Adicione um exemplo'))
          ],
        );
      }
    );
  }


  void limpar(){
    setState(() {
      _AporteMensalController.clear();
      _MesesController.clear();
      _MetaController.clear();
      _TaxaController.clear();
      _ValorInicialController.clear();
      taxa = 0;
      lucro = 0;
      total_investido = 0;
      montanteFinal = 0;
      meta = 0;
      mf = 0;
      msgmeta = '';
      perfil = '';
    });
  }

  void calc(){
    double meta = double.tryParse(_MetaController.text) ?? 0;
    double meses = double.tryParse(_MesesController.text) ?? 0;
    double taxa = double.tryParse(_TaxaController.text) ?? 0;
    double aporte = double.tryParse(_AporteMensalController.text) ?? 0;
    double valorinicial = double.tryParse(_ValorInicialController.text) ?? 0;

    setState(() {
      montanteFinal = valorinicial * math.pow(1 + taxa, meses);
      total_investido = valorinicial + (aporte*meses);
      lucro = montanteFinal - total_investido;
      mf = montanteFinal - meta;

      if (taxa < 0.5){
        perfil = 'Conservador';
      } else if (taxa >= 0.5 && taxa <= 1.5){
        perfil = 'Moderado';
      } else if (taxa > 1.5){
        perfil = 'Agressivo';
      }

      if (montanteFinal >= meta){
        msgmeta = 'Meta alcançada';
      } else{
        msgmeta = 'Faltam $mf reais atingir a meta';
      }
      msg();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('AC01 - Alexandre'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(8),
          child: Column(
            children: [
              addcoisa('1. Valor Inicial', _ValorInicialController),
              addcoisa('2. Aporte Mensal', _AporteMensalController),
              addcoisa('3. Taxa de Juros (%)', _TaxaController),
              addcoisa('4. Quantidade de Meses', _MesesController),
              addcoisa('5. Meta Financeira', _MetaController),
              botao(calc, 'CALCULAR'),
              botao(limparDados, 'Limpar Dados'),
              Text('Perfil Financeiro: $perfil'),
              Text('Total Investido: $total_investido'),
              Text('Lucro: $lucro'),
              Text('$msgmeta'),
            ],
          ),
        ),
        ),
      );
  }
}
