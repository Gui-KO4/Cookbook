import 'ingredients_models.dart';
 
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

  factory Receita.fromJson(Map<String, dynamic> json) {
    return Receita(
      id: json['id_receita'] ?? json['id'] ?? 0,
      idAutor: json['id_autor'] ?? json['idAutor'] ?? 0,
      titulo: json['titulo'] ?? '',
      descricao: json['descricao'] ?? '',
      tempoPreparacao: json['tempo_preparacao'] ?? json['tempoPreparacao'] ?? 0,
      tempoForno: json['tempo_forno'] ?? json['tempoForno'] ?? 0,
      dificuldade: json['dificuldade'] ?? '',
      visibilidade: json['visibilidade'] ?? '',
      foto: json['foto'] ?? '',
      dataCriacao: json['data_criacao'] != null 
          ? DateTime.parse(json['data_criacao'].toString()) 
          : DateTime.now(),
      ingredientes: [],
      passos: [],
    );
  }
}