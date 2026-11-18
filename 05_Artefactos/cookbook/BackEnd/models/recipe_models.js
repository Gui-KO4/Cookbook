const pool = require('../config/db');
 
class Recipe {
    static async getAll() {
        try{
            const [recipes] = await pool.query('Select * from Receitas');
            return recipes;
        }catch(err){
            throw new Error('Failed to get recipes');
        }
    }
    

    static async getById(recipeId){
        try{
            const [recipes] = await pool.query('select * from Receitas where id_receita = ?', [recipeId]);
            return recipes;
        } catch(err){
            throw new Error('Failed to get recipe by ID');
        }
    }
}
 
module.exports = Recipe;
 
