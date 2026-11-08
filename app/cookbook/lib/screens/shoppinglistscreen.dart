import 'package:flutter/material.dart';
import '../Controllers/ingredients_controller.dart';
import '../Controllers/shopping_list_controller.dart';
import '../Models/ingredients_models.dart';
import '../Models/shopping_list_model.dart';
import '../widgets/dropdown_ingredient_card.dart';
import '../widgets/shoppinglistcard.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final IngredientsController _ingredientsController = IngredientsController();
  final ShoppingListController _shoppingController = ShoppingListController();

  final int tempUserId = 1;
  late final Future<List<Ingrediente>> _ingredientsFuture;

  List<ShoppingItem> _shoppingItems = [];
  bool _isLoadingShopping = true;

  @override
  void initState() {
    super.initState();
    _ingredientsFuture = _ingredientsController.fetchAllIngredients();
    _loadShoppingList(showLoader: true);
  }

  Future<void> _loadShoppingList({bool showLoader = false}) async {
    if (showLoader) setState(() => _isLoadingShopping = true);
    final items = await _shoppingController.fetchShoppingList(tempUserId);
    if (!mounted) return;
    setState(() {
      _shoppingItems = items;
      _isLoadingShopping = false;
    });
  }

  Future<void> _addOrUpdateItem(int ingredientId, double quantity) async {
    await _shoppingController.addOrUpdateItem(
      userId: tempUserId,
      ingredientId: ingredientId,
      quantity: quantity,
    );
    await _loadShoppingList();
  }

  Future<void> _updateItemQuantity(
    ShoppingItem item,
    double newQuantity,
  ) async {
    final bool success;

    if (newQuantity <= 0) {
      setState(() => _shoppingItems.remove(item));
      success = await _shoppingController.deleteItem(item.id);
    } else {
      setState(() => item.quantity = newQuantity);
      success =
          await _shoppingController.updateItemQuantity(item.id, newQuantity);
    }

    if (!success) await _loadShoppingList();
  }

  Future<void> _clearList() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Limpar lista?'),
        content: const Text('Todos os ingredientes serão removidos.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Limpar'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    setState(() => _shoppingItems = []);
    final success = await _shoppingController.clearList(tempUserId);
    if (!success) await _loadShoppingList();
  }

  Future<void> _toggleCheck(ShoppingItem item, bool? value) async {
    final newStatus = value ?? false;
    setState(() => item.isChecked = newStatus);
    final success = await _shoppingController.toggleItem(item.id, newStatus);
    if (!success) await _loadShoppingList();
  }

  Widget _buildItemCard(ShoppingItem item) {
    return ShoppingListCard(
      key: ValueKey(item.id),
      item: item,
      onCheckChanged: (val) => _toggleCheck(item, val),
      onIncrement: () => _updateItemQuantity(item, item.quantity + 1),
      onDecrement: () => _updateItemQuantity(item, item.quantity - 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    final toCollect = _shoppingItems.where((i) => !i.isChecked).toList();
    final collected = _shoppingItems.where((i) => i.isChecked).toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 16.0,
        children: [
          Card(
            margin: EdgeInsets.zero,
            elevation: 2,
            shadowColor: Colors.black12,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 24.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Lista de Compras',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _clearList,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(186, 238, 217, 1.0),
                      foregroundColor: const Color(0xFF1B4D3E),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(Icons.refresh),
                  ),
                ],
              ),
            ),
          ),

          // Dropdown
          Card(
            margin: EdgeInsets.zero,
            elevation: 2,
            shadowColor: Colors.black12,
            color: Colors.white,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ExpansionTile(
              maintainState: true,
              title: const Text(
                'Ingredientes',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              iconColor: const Color(0xFF1B4D3E),
              shape: const Border(),
              children: [
                SizedBox(
                  height: 200,
                  child: FutureBuilder<List<Ingrediente>>(
                    future: _ingredientsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final ingredients = snapshot.data ?? [];
                      if (ingredients.isEmpty) {
                        return const Center(child: Text('Sem ingredientes'));
                      }
                      return ListView.builder(
                        padding: const EdgeInsets.all(12),
                        itemExtent: 60,
                        itemCount: ingredients.length,
                        itemBuilder: (context, index) {
                          final ing = ingredients[index];
                          return DropdownIngredientCard(
                            ingredient: ing,
                            onAdd: (quantity) {
                              _addOrUpdateItem(ing.id, quantity.toDouble());
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Por recolher (${toCollect.length})',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Ingredientes',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),

          Expanded(
            child: _isLoadingShopping
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    padding: const EdgeInsets.only(bottom: 80),
                    children: [
                      ...toCollect.map(_buildItemCard),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(Icons.task_alt),
                          const SizedBox(width: 10),
                          Text(
                            'Recolhido (${collected.length})',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ...collected.map(_buildItemCard),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}