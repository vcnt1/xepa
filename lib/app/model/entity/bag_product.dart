class BagProduct {
  BagProduct({
    required this.id,
    required this.idEstabelecimento,
    required this.nome,
    required this.descricao,
    required this.imagem,
    required this.tipo,
    required this.precoOriginal,
    required this.precoPromocional,
    required this.quantidade,
  });

  final String id;
  final String idEstabelecimento;
  final String nome;
  final String descricao;
  final String imagem;
  final String tipo;
  final double precoOriginal;
  final double precoPromocional;
  int quantidade;
}