CREATE DATABASE financeiro;
USE financeiro;
-- Boa Prática
SET NAMES utf8mb4;
SET time_zone = '-03:00';

-- Tabela: USUARIO
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    criado_em TIMESTAMP NOT NULL
      DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP NOT NULL
      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id_usuario)
);

-- Tabela: CATEGORIA
CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT,
    id_usuario INT,
    nome VARCHAR(255) NOT NULL,
    tipo ENUM('receita', 'despesa') NOT NULL,
    criado_em TIMESTAMP NOT NULL
      DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP NOT NULL
      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id_categoria),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE
);

-- Tabela: TRANSACAO
CREATE TABLE transacao (
    id_transacao INT AUTO_INCREMENT,
    id_usuario INT,
    id_categoria INT,
    descricao VARCHAR(255),
    valor DECIMAL(10,2) NOT NULL,
    data_transacao DATE NOT NULL,
    tipo ENUM('receita', 'despesa'),
    criado_em TIMESTAMP NOT NULL
      DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP NOT NULL
      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id_transacao),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria) ON DELETE CASCADE
)