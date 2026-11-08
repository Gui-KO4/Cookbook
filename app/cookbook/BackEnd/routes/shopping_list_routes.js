const express = require('express');
const router = express.Router();
const ShoppingList = require('../models/shopping_list_model');

router.get('/:userId', async (req, res) => {
    try {
        const items = await ShoppingList.getByUser(req.params.userId);
        res.json(items);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.post('/', async (req, res) => {
    try {
        const { id_utilizador, id_ingrediente, quantidade } = req.body;
        const result = await ShoppingList.addItem(id_utilizador, id_ingrediente, quantidade);
        res.status(201).json(result);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.patch('/:itemId', async (req, res) => {
    try {
        const { check_comprado } = req.body;
        const result = await ShoppingList.toggleItem(req.params.itemId, check_comprado);
        res.json(result);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.delete('/:itemId', async (req, res) => {
    try {
        const result = await ShoppingList.deleteItem(req.params.itemId);
        res.json(result);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

module.exports = router;