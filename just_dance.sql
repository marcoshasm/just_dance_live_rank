-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17/04/2023 às 01:58
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `just_dance`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `brackets`
--

CREATE TABLE `brackets` (
  `id` int(11) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `upper` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `brackets`
--

INSERT INTO `brackets` (`id`, `nome`, `upper`) VALUES
(1, 'Lucas', 0),
(2, 'Diovanne', 0),
(3, 'Samuel', 0),
(4, 'Christtofer', 0),
(5, 'Pollyana', 0),
(6, 'Melfhy', 0),
(7, 'Giovanna', 0),
(8, 'Thiago', 0),
(9, 'Diovanne', 0),
(10, 'Christtofer', 0),
(11, 'Melfhy', 0),
(12, 'Thiago', 0),
(13, 'Diovanne', 0),
(14, 'Thiago', 0),
(15, 'Luna', 0),
(16, 'Diovanne', 0),
(17, 'Luna', 0),
(18, 'Ianara', 0),
(19, 'Luna', 0),
(20, 'Anna', 0),
(21, 'Ianara', 0),
(22, 'Hai', 0),
(23, 'Luna', 0),
(24, 'Gustavo', 0),
(25, 'Sofia', 0),
(26, 'Anna', 0),
(27, 'Ianara', 0),
(28, 'Jackson', 0),
(29, 'Hai', 0),
(30, 'Luiza', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `competidores`
--

CREATE TABLE `competidores` (
  `id` int(11) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `group_score` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `competidores`
--

INSERT INTO `competidores` (`id`, `nome`, `group_score`, `group_id`) VALUES
(2, 'Kevin Medina de Jesus', 13022, 1),
(5, 'Diovanne Brunno Dos Santos Barreto', 13209, 2),
(6, 'Horraina Gutierre Bernal', 11007, 11),
(7, 'Josias Matheus Mendes', 10801, 3),
(8, 'Samuel Eustaquio de Souza Oliveira', 11067, 3),
(9, 'Luiza Garcia Vieira', 12162, 12),
(10, 'Christtofer Gomes Moreira', 11689, 4),
(11, 'Nathaly Capriles Souza', 3742, 4),
(12, 'Renato Gunji Saito', 12025, 12),
(13, 'Shine Winters Takahashi', 9506, 5),
(14, 'Pollyana Ferreira Valejo dos Santos', 11124, 5),
(16, 'Ianara Ribeiro Maior', 12872, 6),
(17, 'Melfhy Fany de Queiróz Victório', 12951, 6),
(19, 'Luiz Gustavo Mendes Gomes', 10580, 7),
(21, 'Giovanna Kethelyn Rocha Baeta', 12029, 7),
(22, 'João Vithor de Oliveira Cardoso', 7357, 8),
(24, 'Thiago Henrique Dias', 12579, 8),
(25, 'Luna Giora Barbosa', 12775, 9),
(26, 'Jackson Cotrim', 12641, 9),
(27, 'Anna Luiza Veiga de Carvalho', 12628, 12),
(28, 'Hericky Patrick Nunes Gondim', 13241, 10),
(29, 'Gustavo Franco', 13319, 10),
(30, 'Fábio Assis Saldanha', 12336, 2),
(31, 'Sofia de Alencar Pessoa', 11772, 11),
(32, 'Hai Loureiro Lima', 11315, 11),
(34, 'Lucas dos Santos Soares', 13156, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `artista` varchar(128) NOT NULL,
  `dificuldade` varchar(128) NOT NULL,
  `usada` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `songs`
--

INSERT INTO `songs` (`id`, `nome`, `artista`, `dificuldade`, `usada`) VALUES
(1, 'Teacher', 'Nick Jonas', 'Fácil', 1),
(2, 'Me Too', 'Meghan Trainor', 'Fácil', 1),
(3, 'Bang', 'Anitta', 'Fácil', 1),
(4, 'Je Sais Pas Danser', 'Natoo', 'Fácil', 1),
(5, 'Side To Side', 'Ariana Grande ft. Nicki Minaj', 'Fácil', 1),
(6, 'All You Gotta Do', 'The Just Dance Band', 'Fácil', 1),
(7, 'Instruction', 'Jax Jones ft. Demi Lovato & Stefflon Don', 'Fácil', 1),
(8, 'Make Me Feel', 'Janelle Monáe', 'Fácil', 1),
(9, 'Havana', 'Camila Cabello', 'Fácil', 1),
(10, 'Rhythm Of The Night', 'Ultraclub 90', 'Fácil', 1),
(11, 'Calypso', 'Luis Fonsi Ft. Stefflon Don', 'Fácil', 1),
(12, 'Sangria Wine', 'Pharrel Williams x Camila Cabello', 'Fácil', 1),
(13, 'Djadja', 'Aya Nakamura', 'Fácil', 1),
(14, 'I Don\'t Care', 'Ed Sheeran & Justin Bieber', 'Fácil', 1),
(15, 'Crayon (크레용)', 'G-Dragon', 'Média', 1),
(16, 'Feel So Right', 'Imposs Ft. Konshens', 'Média', 1),
(17, 'Happy', 'Pharrell Williams', 'Média', 1),
(18, 'Maps', 'Maroon 5', 'Média', 1),
(19, 'Fun', 'Pitbull Ft. Chris Brown', 'Média', 1),
(20, 'Hips Don\'t Lie', 'Shakira Jean', 'Média', 1),
(21, 'Feel It Still', 'Portuga. The Man', 'Média', 1),
(22, 'Footloose', 'Top Culture', 'Média', 1),
(23, 'TOY', 'Netta', 'Média', 1),
(24, 'Don\'t Call Me Up', 'Mabel', 'Média', 1),
(25, 'Só Depois Do Carnaval', 'Lexa', 'Média', 1),
(26, 'Soy Yo', 'Bomba Estéreo', 'Média', 1),
(27, 'Tusa', 'Karol G, Nicki Minaj', 'Média', 1),
(28, 'Magenta Riddim', 'DJ Snake', 'Média', 1),
(29, 'Intoxicated', 'Martin Solveing & GTA', 'Média', 1),
(30, 'Dance Monkey', 'Tones And I', 'Média', 1),
(31, 'The Other Side', 'SZA & Justin Timberlake', 'Média', 1),
(32, 'Smalltown Boy', 'Bronski Beat', 'Média', 1),
(33, 'Till I Find You', 'Austin Mahone', 'Difícil', 1),
(34, 'New World', 'Krewella, Yellow Claw Ft. Vava', 'Difícil', 1),
(35, 'MA ITÚ', 'Stella Mwangi', 'Difícil', 1),
(36, 'Vodovorot', 'XS Project', 'Difícil', 1),
(37, 'Turn Up The Love', 'Far East Movement & Cover Drive', 'Extrema', 0),
(38, 'Sorry', 'Justin bieber', 'Extrema', 1),
(39, 'HandsClap', 'Fitz and The Tantrums', 'Extrema', 1),
(40, '24K Magic', 'Bruno Mars', 'Extrema', 1),
(41, 'Tumbum', 'Yemi Alade', 'Extrema', 1),
(42, 'Finesse (Remix)', 'Bruno Mars Ft. Cardi B', 'Extrema', 1),
(43, 'OMG', 'Arash Ft. Snoop Dogg', 'Extrema', 1),
(44, 'Medicina', 'Anitta', 'Extrema', 0),
(45, 'Bad Guy', 'Billie Eilish', 'Extrema', 1),
(46, 'Kill This Love', 'BLACKPINK', 'Extrema', 1),
(47, 'Talk', 'Khalid', 'Extrema', 0),
(48, 'Without Me', 'Eminem', 'Extrema', 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `brackets`
--
ALTER TABLE `brackets`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `competidores`
--
ALTER TABLE `competidores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `brackets`
--
ALTER TABLE `brackets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `competidores`
--
ALTER TABLE `competidores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de tabela `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
