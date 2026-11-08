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