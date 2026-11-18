class ShoppingList {
  final int idLista;
  final int idUtilizador;
  final DateTime? dataCriacao;
  final List<ShoppingItem> items;

  const ShoppingList({
    required this.idLista,
    required this.idUtilizador,
    this.dataCriacao,
    this.items = const [],
  });

  factory ShoppingList.fromJson(Map<String, dynamic> json) {
    final rawItems = json['items'] as List<dynamic>? ?? [];
    return ShoppingList(
      idLista: (json['id_lista'] ?? json['id'] ?? 0) as int,
      idUtilizador: (json['id_utilizador'] ?? 0) as int,
      dataCriacao: json['data_criacao'] != null
          ? DateTime.tryParse(json['data_criacao'].toString())
          : null,
      items: rawItems
          .map((item) => ShoppingItem.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ShoppingItem {
  final int id; 
  final int? listId; 
  final int ingredientId; 
  final String name;
  double quantity; 
  bool isChecked; 

  ShoppingItem({
    required this.id,
    this.listId,
    required this.ingredientId,
    required this.name,
    required this.quantity,
    this.isChecked = false,
  });

  factory ShoppingItem.fromJson(Map<String, dynamic> json) {
    final rawCheck = json['isChecked'] ?? json['check_comprado'] ?? 0;
    return ShoppingItem(
      id: (json['id'] ?? json['id_item'] ?? 0) as int,
      listId: (json['id_lista'] ?? json['listId']) as int?,
      ingredientId: (json['id_ingrediente'] ?? json['ingredientId'] ?? 0) as int,
      name: (json['name'] ?? json['nome'] ?? '') as String,
      quantity: double.tryParse(
            (json['quantity'] ?? json['quantidade'] ?? 1).toString(),
          ) ??
          1.0,
      isChecked: rawCheck == true || rawCheck == 1,
    );
  }

  Map<String, dynamic> toJson() => {
        'id_item': id,
        if (listId != null) 'id_lista': listId,
        'id_ingrediente': ingredientId,
        'quantidade': quantity,
        'check_comprado': isChecked,
      };
}