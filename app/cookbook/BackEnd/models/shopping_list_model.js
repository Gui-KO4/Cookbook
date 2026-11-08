const pool = require('../config/db.js');

class ShoppingList {
    static async getByUser(userId) {
        try {
            // Find user
            let [lists] = await pool.query('SELECT id_lista FROM ListaCompras WHERE id_utilizador = ?', [userId]);
            let listId;
            
            if (lists.length === 0) {
                const [result] = await pool.query('INSERT INTO ListaCompras (id_utilizador) VALUES (?)', [userId]);
                listId = result.insertId;
            } else {
                listId = lists[0].id_lista;
            }

            // Get items
            const [items] = await pool.query(`
                SELECT ci.id_item AS id, i.nome AS name, ci.quantidade AS quantity, ci.check_comprado AS isChecked
                FROM ComprasItems ci
                JOIN Ingrediente i ON ci.id_ingrediente = i.id_ingrediente
                WHERE ci.id_lista = ?
            `, [listId]);

            return items;
        } catch (err) {
            throw new Error('Failed to fetch shopping list: ' + err.message);
        }
    }

    static async addItem(userId, ingredientId, quantity) {
        try {
            let [lists] = await pool.query('SELECT id_lista FROM ListaCompras WHERE id_utilizador = ?', [userId]);
            let listId = lists[0].id_lista;

            const [result] = await pool.query(`
                INSERT INTO ComprasItems (id_lista, id_ingrediente, quantidade, check_comprado)
                VALUES (?, ?, ?, FALSE)
            `, [listId, ingredientId, quantity]);

            return { id_item: result.insertId, message: 'Item added' };
        } catch (err) {
            throw new Error('Failed to add shopping item: ' + err.message);
        }
    }

    static async toggleItem(itemId, checkStatus) {
        try {
            await pool.query('UPDATE ComprasItems SET check_comprado = ? WHERE id_item = ?', [checkStatus, itemId]);
            return { message: 'Item updated' };
        } catch (err) {
            throw new Error('Failed to update item: ' + err.message);
        }
    }

    static async deleteItem(itemId) {
        try {
            await pool.query('DELETE FROM ComprasItems WHERE id_item = ?', [itemId]);
            return { message: 'Item deleted' };
        } catch (err) {
            throw new Error('Failed to delete item: ' + err.message);
        }
    }
}

module.exports = ShoppingList;