class Veiculo {
  static const CAMPO_ID = '_id';
  static const CAMPO_NOME = 'nome';
  static const CAMPO_PLACA = 'placa';

  int id;
  String nome;
  String placa;
  bool ativo;


  Veiculo({
    required this.id,
    required this.nome,
    required this.placa,
    this.ativo = true,
  });
}