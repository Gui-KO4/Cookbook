-- Utilizador Queries
SELECT id_utilizador, nome, username, email, data_registo
FROM Utilizador
WHERE admin_check = TRUE;

SELECT id_utilizador, nome, username, email, data_registo
FROM Utilizador
WHERE admin_check = FALSE;

-- Lista Queries
SELECT ci.id_item        AS id,
       i.nome            AS name,
       ci.quantidade     AS quantity,
       ci.check_comprado AS isChecked
FROM ComprasItems ci
JOIN ListaCompras l ON ci.id_lista = l.id_lista
JOIN Ingrediente i  ON ci.id_ingrediente = i.id_ingrediente
WHERE l.id_utilizador = 1;

-- Ingrediente Queries
SELECT id_ingrediente AS id, nome AS name
FROM Ingrediente ORDER BY id_ingrediente;

-- Receita Queries
