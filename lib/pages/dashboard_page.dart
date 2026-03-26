import 'package:flutter/material.dart';
import '../model/veiculo.dart';

class DashboardPage extends StatelessWidget {
  final List<Veiculo> veiculos;

  const DashboardPage({super.key, required this.veiculos});

  @override
  Widget build(BuildContext context) {
    final total = veiculos.length;
    final ativos = veiculos.where((v) => v.ativo).length;
    final inativos = total - ativos;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumo da Frota'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _card('Total de veículos', total, Colors.blue),
            _card('Ativos', ativos, Colors.green),
            _card('Inativos', inativos, Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _card(String titulo, int valor, Color cor) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(Icons.analytics, color: cor),
        title: Text(titulo),
        trailing: Text(
          valor.toString(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: cor,
          ),
        ),
      ),
    );
  }
}