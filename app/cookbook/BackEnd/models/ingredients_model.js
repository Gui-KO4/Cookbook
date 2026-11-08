const pool = require('../config/db.js');

class Ingredient {
    static async getAll() {
        try {
            const [ingredients] = await pool.query('SELECT id_ingrediente AS id, nome AS name FROM Ingrediente');
            return ingredients;
        } catch (err) {
            throw new Error('Failed to get ingredients: ' + err.message);
        }
    }
}

module.exports = Ingredient;