class Ingrediente {
  final int id;
  final String name;
  final String type;
  final bool add;
  final int quantity;

  const Ingrediente(
    this.name,
    this.type,
    this.add,
    this.quantity, {
    this.id = 0,
  });

  factory Ingrediente.fromJson(Map<String, dynamic> json) {
    return Ingrediente(
      (json['name'] ?? json['nome'] ?? '') as String,
      (json['type'] ?? 'Ingrediente') as String,
      false,
      1,
      id: (json['id'] ?? json['id_ingrediente'] ?? 0) as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'id_ingrediente': id,
        'nome': name,
      };
}