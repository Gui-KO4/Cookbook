const express = require('express');
const ShoppingList = require('../models/shopping_list_model');

const router = express.Router();

const handleError = (res, err) => res.status(500).json({ error: err.message });

router.get('/:userId', async (req, res) => {
  try {
    res.json(await ShoppingList.getByUser(req.params.userId));
  } catch (err) {
    handleError(res, err);
  }
});

router.post('/', async (req, res) => {
  try {
    const { id_utilizador, id_ingrediente, quantidade } = req.body;
    if (!id_utilizador || !id_ingrediente || !(quantidade > 0)) {
      return res.status(400).json({ error: 'Invalid payload' });
    }
    const result = await ShoppingList.addItem(id_utilizador, id_ingrediente, quantidade);
    res.status(201).json(result);
  } catch (err) {
    handleError(res, err);
  }
});

router.delete('/clear/:userId', async (req, res) => {
  try {
    res.json(await ShoppingList.clearList(req.params.userId));
  } catch (err) {
    handleError(res, err);
  }
});

router.patch('/:itemId', async (req, res) => {
  try {
    const { quantidade, check_comprado } = req.body;
    res.json(await ShoppingList.updateItem(req.params.itemId, { quantidade, check_comprado }));
  } catch (err) {
    handleError(res, err);
  }
});

router.delete('/:itemId', async (req, res) => {
  try {
    res.json(await ShoppingList.deleteItem(req.params.itemId));
  } catch (err) {
    handleError(res, err);
  }
});

module.exports = router;