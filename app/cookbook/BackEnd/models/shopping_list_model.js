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

    static async getOrCreateListId(userId) {
    const [lists] = await pool.query(
        'SELECT id_lista FROM ListaCompras WHERE id_utilizador = ?',
        [userId]
    );
    if (lists.length > 0) return lists[0].id_lista;

    const [result] = await pool.query(
        'INSERT INTO ListaCompras (id_utilizador) VALUES (?)',
        [userId]
    );
    return result.insertId;
    }

    static async addItem(userId, ingredientId, quantity) {
    try {
        const listId = await this.getOrCreateListId(userId);

        const [existing] = await pool.query(
        'SELECT id_item FROM ComprasItems WHERE id_lista = ? AND id_ingrediente = ?',
        [listId, ingredientId]
        );

        if (existing.length > 0) {
        await pool.query(
            'UPDATE ComprasItems SET quantidade = quantidade + ?, check_comprado = FALSE WHERE id_item = ?',
            [quantity, existing[0].id_item]
        );
        return { id_item: existing[0].id_item, message: 'Item quantity updated' };
        }

        const [result] = await pool.query(
        `INSERT INTO ComprasItems (id_lista, id_ingrediente, quantidade, check_comprado)
        VALUES (?, ?, ?, FALSE)`,
        [listId, ingredientId, quantity]
        );
        return { id_item: result.insertId, message: 'Item added' };
    } catch (err) {
        throw new Error('Failed to add shopping item: ' + err.message);
    }
    }

    static async updateItem(itemId, { quantidade, check_comprado }) {
        try {
            let fields = [];
            let values = [];

            if (quantidade !== undefined) {
                fields.push('quantidade = ?');
                values.push(quantidade);
            }
            if (check_comprado !== undefined) {
                fields.push('check_comprado = ?');
                values.push(check_comprado);
            }

            if (fields.length === 0) return { message: 'Nothing to update' };

            values.push(itemId);
            await pool.query(`UPDATE ComprasItems SET ${fields.join(', ')} WHERE id_item = ?`, values);

            return { message: 'Item updated successfully' };
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
    
    static async clearList(userId) {
        try {
            const [lists] = await pool.query('SELECT id_lista FROM ListaCompras WHERE id_utilizador = ?', [userId]);
            if (lists.length === 0) return { message: 'No list found' };
            
            const listId = lists[0].id_lista;

            await pool.query('DELETE FROM ComprasItems WHERE id_lista = ?', [listId]);

            return { message: 'Shopping list cleared successfully' };
        } catch (err) {
            throw new Error('Failed to clear shopping list: ' + err.message);
        }
    }
}

module.exports = ShoppingList;