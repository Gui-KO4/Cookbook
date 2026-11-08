class Templistareceitas {
  final String nome;
  final String unidade;
  final int quantidade;
  final String nota;
  final bool colletada;

  const Templistareceitas({
    required this.nome,
    required this.unidade,
    required this.quantidade,
    required this.nota,
    this.colletada = false,
  });
}