import 'package:flutter/material.dart';
import 'package:gerenciador_de_frota/model/veiculo.dart';
import 'package:gerenciador_de_frota/pages/filtro_page.dart';
import 'package:gerenciador_de_frota/widgets/conteudo_form_dialog.dart';
import 'package:gerenciador_de_frota/pages/detalhe_veiculo_page.dart';
import 'package:gerenciador_de_frota/pages/dashboard_page.dart';

class ListaVeiculosPage extends StatefulWidget {
  @override
  _ListaVeiculosPageState createState() => _ListaVeiculosPageState();
}

class _ListaVeiculosPageState extends State<ListaVeiculosPage> {
  static const ACAO_EDITAR = 'Editar';
  static const ACAO_EXCLUIR = 'Excluir';

  final _veiculos = <Veiculo>[
    Veiculo(id: 1, nome: 'Caminhão', placa: 'ABC-1234'),
  ];

  int ultimoId = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _criarAppBar(),
      body: _criarBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirForm,
        child: const Icon(Icons.add),
      ),
    );
  }

  AppBar _criarAppBar() {
    return AppBar(
      title: const Text('Veículos'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: _abrirFiltro,
          icon: const Icon(Icons.list),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DashboardPage(veiculos: _veiculos),
              ),
            );
          },
          icon: const Icon(Icons.dashboard),
        )
      ],
    );
  }

  Widget _criarBody() {
    if (_veiculos.isEmpty) {
      return const Center(
        child: Text('Nenhum veículo encontrado'),
      );
    }

    return ListView.separated(
      itemCount: _veiculos.length,
      itemBuilder: (context, index) {
        final veiculo = _veiculos[index];

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: PopupMenuButton(
            itemBuilder: (_) => _criarMenu(),
            onSelected: (value) {
              if (value == ACAO_EDITAR) {
                _abrirForm(veiculoAtual: veiculo, indice: index);
              } else {
                _excluir(index);
              }
            },
            child: ListTile(
              leading: const Icon(Icons.directions_car, size: 32),
              title: Text(
                veiculo.nome,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Placa: ${veiculo.placa}'),
              trailing: const Icon(Icons.more_vert),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        DetalheVeiculoPage(veiculo: veiculo),
                  ),
                );
              },
            ),
          ),
        );
      }, // ✅ FECHAVA AQUI (faltava isso)
      separatorBuilder: (_, __) => const Divider(),
    );
  }

  List<PopupMenuEntry<String>> _criarMenu() {
    return [
      const PopupMenuItem(
        value: ACAO_EDITAR,
        child: Text('Editar'),
      ),
      const PopupMenuItem(
        value: ACAO_EXCLUIR,
        child: Text('Excluir'),
      ),
    ];
  }

  void _excluir(int index) {
    setState(() {
      _veiculos.removeAt(index);
    });
  }

  void _abrirFiltro() {
    Navigator.of(context).pushNamed(FiltroPage.ROUTE_NAME);
  }

  void _abrirForm({Veiculo? veiculoAtual, int? indice}) {
    final key = GlobalKey<ConteudoFormDialogState>();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(veiculoAtual == null
            ? 'Novo Veículo'
            : 'Editar Veículo ${veiculoAtual.id}'),
        content: ConteudoFormDialog(
          key: key,
          veiculoAtual: veiculoAtual,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              if (key.currentState!.dadosValidados()) {
                setState(() {
                  final novo = key.currentState!.novoVeiculo;

                  if (indice == null) {
                    novo.id = ++ultimoId;
                    _veiculos.add(novo);
                  } else {
                    _veiculos[indice] = novo;
                  }
                });
                Navigator.pop(context);
              }
            },
            child: const Text('Salvar'),
          )
        ],
      ),
    );
  }
}