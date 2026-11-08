const express = require('express');
const router = express.Router();
const Ingredient = require('../models/ingredients_model');

router.get('/', async (req, res) => {
    try {
        const ingredients = await Ingredient.getAll();
        res.json(ingredients);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

module.exports = router;