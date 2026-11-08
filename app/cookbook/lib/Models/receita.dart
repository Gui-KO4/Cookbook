import 'ingredients.dart';
 
class Receita {
  final int id;
  final int idAutor;
  final String titulo;
  final String descricao;
  final int tempoPreparacao;
  final int tempoForno;
  final String dificuldade; 
  final String visibilidade; 
  final String foto;
  final DateTime dataCriacao;

  final List<Ingrediente> ingredientes;
  final List<String> passos;
 
  const Receita({
    required this.id,
    required this.idAutor,
    required this.titulo,
    required this.descricao,
    required this.tempoPreparacao,
    required this.tempoForno,
    required this.dificuldade,
    required this.visibilidade,
    required this.foto,
    required this.dataCriacao,
    this.ingredientes = const [],
    this.passos = const [],
  });

  
}