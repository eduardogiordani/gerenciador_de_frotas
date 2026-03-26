import 'package:flutter/material.dart';
import 'package:gerenciador_de_frota/model/veiculo.dart';

class ConteudoFormDialog extends StatefulWidget {
  final Veiculo? veiculoAtual;

  const ConteudoFormDialog({Key? key, this.veiculoAtual})
      : super(key: key);

  @override
  ConteudoFormDialogState createState() =>
      ConteudoFormDialogState();
}

class ConteudoFormDialogState extends State<ConteudoFormDialog> {
  final formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final placaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.veiculoAtual != null) {
      nomeController.text = widget.veiculoAtual!.nome;
      placaController.text = widget.veiculoAtual!.placa;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(children: [
        TextFormField(
          controller: nomeController,
          decoration: const InputDecoration(
            labelText: 'Nome',
            prefixIcon: Icon(Icons.directions_car),
          ),
          validator: (v) =>
          v == null || v.isEmpty ? 'Informe o nome' : null,
        ),

        const SizedBox(height: 10),

        TextFormField(
          controller: placaController,
          decoration: const InputDecoration(
            labelText: 'Placa',
            prefixIcon: Icon(Icons.confirmation_number),
          ),
          validator: (v) =>
          v == null || v.isEmpty ? 'Informe a placa' : null,
        ),
      ],),
    );
  }

  bool dadosValidados() => formKey.currentState?.validate() == true;

  Veiculo get novoVeiculo => Veiculo(
    id: widget.veiculoAtual?.id ?? 0,
    nome: nomeController.text,
    placa: placaController.text,
  );
}