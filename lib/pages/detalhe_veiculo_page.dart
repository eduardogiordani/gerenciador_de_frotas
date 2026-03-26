import 'package:flutter/material.dart';
import '../model/veiculo.dart';

class DetalheVeiculoPage extends StatelessWidget {
  final Veiculo veiculo;

  const DetalheVeiculoPage({super.key, required this.veiculo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Veículo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(Icons.directions_car, size: 80),
            const SizedBox(height: 20),

            Text(
              veiculo.nome,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'Placa: ${veiculo.placa}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}