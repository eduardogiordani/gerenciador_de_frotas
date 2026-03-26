import 'package:flutter/material.dart';
import 'package:gerenciador_de_frota/model/veiculo.dart';

class FiltroPage extends StatefulWidget {
  static const ROUTE_NAME = '/filtro';

  @override
  _FiltroPageState createState() => _FiltroPageState();
}

class _FiltroPageState extends State<FiltroPage> {
  final _campos = {
    Veiculo.CAMPO_ID: 'Código',
    Veiculo.CAMPO_NOME: 'Nome',
    Veiculo.CAMPO_PLACA: 'Placa',
  };

  String campoSelecionado = Veiculo.CAMPO_ID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filtro')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ordenar por:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: [
                  for (final campo in _campos.keys)
                    Card(
                      child: RadioListTile(
                        value: campo,
                        groupValue: campoSelecionado,
                        title: Text(_campos[campo]!),
                        onChanged: (value) {
                          setState(() {
                            campoSelecionado = value!;
                          });
                        },
                      ),
                    ),
                ],
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Aplicar'),
            )
          ],
        ),
      ),
    );
  }
}