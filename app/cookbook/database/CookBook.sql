-- Criar Database
DROP DATABASE IF EXISTS CookBook;
CREATE DATABASE CookBook;

-- Selecionar a Database
USE CookBook;

-- Utilizador/Admin
CREATE TABLE Utilizador (
    id_utilizador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    foto VARCHAR(500) DEFAULT NULL,
    bio TEXT DEFAULT NULL,
    admin_check BOOLEAN DEFAULT FALSE,
    data_registo DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Receitas
CREATE TABLE Receitas (
    id_receita INT AUTO_INCREMENT PRIMARY KEY,
    id_autor INT NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT,
    tempo_preparacao INT NOT NULL,
    tempo_forno INT DEFAULT 0,
    dificuldade ENUM('Facil', 'Medio', 'Dificil') NOT NULL DEFAULT 'Medio',
    visibilidade ENUM('Publico', 'Privado') NOT NULL DEFAULT 'Publico',
    foto VARCHAR(500) DEFAULT NULL,
    data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_receita_autor FOREIGN KEY (id_autor) REFERENCES Utilizador(id_utilizador) ON DELETE CASCADE
);
-- Passos das Receitas
CREATE TABLE Passo (
    id_passo INT AUTO_INCREMENT PRIMARY KEY,
    id_receita INT NOT NULL,
    ordem INT NOT NULL,
    instrucoes TEXT NOT NULL,
    duracao_min INT DEFAULT NULL,
    CONSTRAINT fk_passo_receita FOREIGN KEY (id_receita) REFERENCES Receitas(id_receita) ON DELETE CASCADE,
    UNIQUE KEY uk_receita_ordem (id_receita, ordem)
);

-- Ingredientes e Lista de Ingredientes
CREATE TABLE Ingrediente (
    id_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE ListaIngredientes (
    id_receita INT NOT NULL,
    id_ingrediente INT NOT NULL,
    quantidade DECIMAL(10, 2) NOT NULL,
    unidade VARCHAR(30) NOT NULL,
    nota VARCHAR(150) DEFAULT NULL,
    PRIMARY KEY (id_receita, id_ingrediente),
    CONSTRAINT fk_list_receita FOREIGN KEY (id_receita) REFERENCES Receitas(id_receita) ON DELETE CASCADE,
    CONSTRAINT fk_list_ingrediente FOREIGN KEY (id_ingrediente) REFERENCES Ingrediente(id_ingrediente) ON DELETE RESTRICT
);

-- Categoria de Receitas
CREATE TABLE Categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE Receita_Categoria (
    id_receita INT NOT NULL,
    id_categoria INT NOT NULL,
    PRIMARY KEY (id_receita, id_categoria),
    CONSTRAINT fk_rc_receita FOREIGN KEY (id_receita) REFERENCES Receitas(id_receita) ON DELETE CASCADE,
    CONSTRAINT fk_rc_categoria FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria) ON DELETE CASCADE
);

-- Avaliações das Receitas e Favoritos

CREATE TABLE Avaliacoes (
    id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
    id_utilizador INT NOT NULL,
    id_receita INT NOT NULL,
    classificacao INT NOT NULL CHECK (classificacao BETWEEN 1 AND 5),
    data DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_aval_utilizador FOREIGN KEY (id_utilizador) REFERENCES Utilizador(id_utilizador) ON DELETE CASCADE,
    CONSTRAINT fk_aval_receita FOREIGN KEY (id_receita) REFERENCES Receitas(id_receita) ON DELETE CASCADE,
    UNIQUE KEY uk_aval_user_receita (id_utilizador, id_receita)
);

CREATE TABLE Favoritos (
    id_utilizador INT NOT NULL,
    id_receita INT NOT NULL,
    data_added DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_utilizador, id_receita),
    CONSTRAINT fk_fav_utilizador FOREIGN KEY (id_utilizador) REFERENCES Utilizador(id_utilizador) ON DELETE CASCADE,
    CONSTRAINT fk_fav_receita FOREIGN KEY (id_receita) REFERENCES Receitas(id_receita) ON DELETE CASCADE
);

-- Coleção e Coleções de Receitas
CREATE TABLE Colecao (
    id_colecao INT AUTO_INCREMENT PRIMARY KEY,
    id_utilizador INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_colecao_utilizador FOREIGN KEY (id_utilizador) REFERENCES Utilizador(id_utilizador) ON DELETE CASCADE
);

CREATE TABLE Colecao_Receitas (
    id_colecao INT NOT NULL,
    id_receita INT NOT NULL,
    PRIMARY KEY (id_colecao, id_receita),
    CONSTRAINT fk_colectrec_colecao FOREIGN KEY (id_colecao) REFERENCES Colecao(id_colecao) ON DELETE CASCADE,
    CONSTRAINT fk_colectrec_receita FOREIGN KEY (id_receita) REFERENCES Receitas(id_receita) ON DELETE CASCADE
);


-- Listas de Compras e Itens

CREATE TABLE ListaCompras (
    id_lista INT AUTO_INCREMENT PRIMARY KEY,
    id_utilizador INT NOT NULL,
    data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_lista_utilizador FOREIGN KEY (id_utilizador) REFERENCES Utilizador(id_utilizador) ON DELETE CASCADE
);

CREATE TABLE ComprasItems (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_lista INT NOT NULL,
    id_ingrediente INT NOT NULL,
    quantidade DECIMAL(10, 2) NOT NULL,
    check_comprado BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT fk_comprItem_lista FOREIGN KEY (id_lista) REFERENCES ListaCompras(id_lista) ON DELETE CASCADE,
    CONSTRAINT fk_comprItem_ingrediente FOREIGN KEY (id_ingrediente) REFERENCES Ingrediente(id_ingrediente) ON DELETE CASCADE
);

-- Populate 
USE cookbook

-- Categorias
INSERT INTO Categoria (id_categoria, nome) VALUES
(1, 'Carne de Vaca'),
(2, 'Frango'),
(3, 'Sobremesa'),
(4, 'Carne de Porco'),
(5, 'Diversos'),
(6, 'Massa'),
(7, 'Marisco'),
(8, 'Acompanhamento'),
(9, 'Entrada'),
(10, 'Vegan'),
(11, 'Vegetariano'),
(12, 'Pequeno-almoço');

-- Ingredientes
INSERT INTO Ingrediente (id_ingrediente, nome) VALUES
(1, 'Esparguete'),
(2, 'Peito de Frango'),
(3, 'Natas'),
(4, 'Alho'),
(5, 'Azeite'),
(6, 'Queijo Parmesão'),
(7, 'Sal'),
(8, 'Pimenta Preta'),
(9, 'Bife da Vazia'),
(10, 'Manteiga'),
(11, 'Batata'),
(12, 'Alecrim'),
(13, 'Ovos'),
(14, 'Açúcar'),
(15, 'Chocolate Negro'),
(16, 'Farinha de Trigo');

-- Receitas 
INSERT INTO Receitas (id_receita, id_autor, titulo, descricao, tempo_preparacao, tempo_forno, dificuldade, visibilidade, foto) VALUES
(1, 1, 'Massa Cremosa de Frango e Parmesão', 'Esparguete envolvido num molho cremoso de natas, alho e queijo parmesão com pedaços de frango dourado.', 25, 0, 'Facil', 'Publico', 'https://exemplo.com/fotos/massa_frango.jpg'),
(2, 1, 'Bife da Vazia com Batatas Assadas', 'Bife suculento grelhado com manteiga de alho e alecrim, acompanhado de batatas rústicas no forno.', 15, 35, 'Medio', 'Publico', 'https://exemplo.com/fotos/bife_batatas.jpg'),
(3, 1, 'Petit Gâteau de Chocolate', 'Bolo pequeno de chocolate com interior cremoso, ideal para finalizar a refeição.', 15, 10, 'Dificil', 'Publico', 'https://exemplo.com/fotos/petit_gateau.jpg');

-- Associação Receita
INSERT INTO Receita_Categoria (id_receita, id_categoria) VALUES
(1, 2), -- Massa Cremosa 
(1, 6), -- Massa Cremosa 
(2, 1), -- Bife da Vazia 
(2, 8), -- Bife da Vazia 
(3, 3); -- Petit Gâteau 

-- Lista de Ingredientes por Receita
INSERT INTO ListaIngredientes (id_receita, id_ingrediente, quantidade, unidade, nota) VALUES
(1, 1, 250.00, 'g', NULL),
(1, 2, 300.00, 'g', 'Cortado em cubos'),
(1, 3, 200.00, 'ml', 'Natas para culinária'),
(1, 4, 2.00, 'dentes', 'Picados'),
(1, 5, 2.00, 'colheres de sopa', NULL),
(1, 6, 50.00, 'g', 'Ralado na hora'),
(1, 7, 1.00, 'q.b.', NULL),
(1, 8, 1.00, 'q.b.', NULL),

(2, 9, 400.00, 'g', '2 bifes altos'),
(2, 10, 30.00, 'g', 'Sem sal'),
(2, 11, 500.00, 'g', 'Cortadas em cubos com casca'),
(2, 12, 2.00, 'ramos', 'Frescos'),
(2, 4, 3.00, 'dentes', 'Esmagados'),
(2, 5, 3.00, 'colheres de sopa', NULL),
(2, 7, 1.00, 'q.b.', 'Sal grosso'),
(2, 8, 1.00, 'q.b.', NULL),

(3, 15, 200.00, 'g', 'Mínimo 70% cacau'),
(3, 10, 150.00, 'g', NULL),
(3, 13, 4.00, 'unidades', '2 inteiros + 2 gemas'),
(3, 14, 100.00, 'g', NULL),
(3, 16, 50.00, 'g', 'Peneirada');

-- Passos das Receitas
INSERT INTO Passo (id_receita, ordem, instrucoes, duracao_min) VALUES
(1, 1, 'Cozer o esparguete em água a ferver temperada com sal até ficar al dente.', 10),
(1, 2, 'Temperar os cubos de frango com sal e pimenta e dourar numa frigideira com azeite e alho picado.', 8),
(1, 3, 'Reduzir o lume, adicionar as natas e o queijo parmesão ralado, mexendo até o molho engrossar.', 5),
(1, 4, 'Escorrer a massa, envolver diretamente no molho com o frango e servir de imediato.', 2),

(2, 1, 'Pré-aquecer o forno a 200°C. Dispor as batatas num tabuleiro com azeite, sal, pimenta e metade do alecrim, e levar a assar.', 35),
(2, 2, 'Aquecer uma frigideira de ferro até estar bem quente e selar os bifes temperados com sal e pimenta de ambos os lados.', 4),
(2, 3, 'Juntar a manteiga, os dentes de alho esmagados e o restante alecrim, regando os bifes com a manteiga derretida.', 2),
(2, 4, 'Retirar os bifes para uma tábua e deixar repousar antes de servir com as batatas assadas.', 5),

(3, 1, 'Derreter o chocolate negro juntamente com a manteiga em banho-maria até obter um creme liso.', 5),
(3, 2, 'Bater os ovos, as gemas e o açúcar numa taça até formar um creme esbranquiçado.', 5),
(3, 3, 'Incorporar o chocolate derretido e a farinha peneirada, envolvendo suavemente com uma espátula.', 5),
(3, 4, 'Distribuir por formas untadas e polvilhadas e levar ao forno pré-aquecido a 200°C.', 10);