SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `plataformaensinopresencial` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `plataformaensinopresencial`;

DROP TABLE IF EXISTS `alunos`;
CREATE TABLE `alunos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `matricula` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `createUser` varchar(100) NOT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `cpf` varchar(15) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

TRUNCATE TABLE `alunos`;
INSERT INTO `alunos` (`id`, `nome`, `matricula`, `email`, `curso_id`, `createUser`, `senha`, `cpf`, `telefone`) VALUES
(2, 'Mariana Oliveira', '2023002', 'mariana.oliveira@escola.com', 2, 'secretaria', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '22233344455', '11988887776'),
(3, 'Pedro Santos', '2023003', 'pedro.santos@escola.com', 3, 'secretaria', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '33344455566', '11988887775'),
(4, 'Ana Pereira', '2023004', 'ana.pereira@escola.com', 4, 'secretaria', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '44455566677', '11988887774'),
(6, 'Carla Alves', '2023006', 'carla.alves@escola.com', 6, 'secretaria', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '66677788899', '11988887772'),
(7, 'Rafael Nunes', '2023007', 'rafael.nunes@escola.com', 7, 'secretaria', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '77788899900', '11988887771'),
(8, 'Laura Lima', '2023008', 'laura.lima@escola.com', 8, 'secretaria', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '88899900011', '11988887770'),
(75, 'Ana Oliveira', 'MAT2023001', 'ana.oliveira@escola.com', 9, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '111.222.333-44', '(11) 91234-5678'),
(76, 'Bruno Costa', 'MAT2023002', 'bruno.costa@escola.com', 9, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '222.333.444-55', '(11) 92345-6789'),
(77, 'Carla Santos', 'MAT2023003', 'carla.santos@escola.com', 9, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '333.444.555-66', '(11) 93456-7890'),
(78, 'Daniel Pereira', 'MAT2023004', 'daniel.pereira@escola.com', 9, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '444.555.666-77', '(11) 94567-8901'),
(79, 'Eduarda Lima', 'MAT2023005', 'eduarda.lima@escola.com', 9, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '555.666.777-88', '(11) 95678-9012'),
(80, 'Felipe Rocha', 'MAT2023006', 'felipe.rocha@escola.com', 9, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '666.777.888-99', '(11) 96789-0123'),
(81, 'Gabriela Alves', 'MAT2023007', 'gabriela.alves@escola.com', 9, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '777.888.999-00', '(11) 97890-1234'),
(82, 'Henrique Souza', 'MAT2023008', 'henrique.souza@escola.com', 9, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '888.999.000-11', '(11) 98901-2345'),
(83, 'Isabela Ferreira', 'MAT2023009', 'isabela.ferreira@escola.com', 9, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '999.000.111-22', '(11) 99012-3456'),
(84, 'João Pedro Martins', 'MAT2023010', 'joao.martins@escola.com', 9, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '000.111.222-33', '(11) 90123-4567'),
(85, 'Laura Mendes', 'FIS2023001', 'laura.mendes@escola.com', 10, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '123.456.789-01', '(11) 91111-1111'),
(86, 'Marcos Antônio', 'FIS2023002', 'marcos.antonio@escola.com', 10, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '234.567.890-12', '(11) 92222-2222'),
(87, 'Natália Campos', 'FIS2023003', 'natalia.campos@escola.com', 10, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '345.678.901-23', '(11) 93333-3333'),
(88, 'Otávio Ribeiro', 'FIS2023004', 'otavio.ribeiro@escola.com', 10, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '456.789.012-34', '(11) 94444-4444'),
(89, 'Patrícia Nunes', 'FIS2023005', 'patricia.nunes@escola.com', 10, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '567.890.123-45', '(11) 95555-5555'),
(90, 'Ricardo Teixeira', 'FIS2023006', 'ricardo.teixeira@escola.com', 10, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '678.901.234-56', '(11) 96666-6666'),
(91, 'Sofia Cardoso', 'FIS2023007', 'sofia.cardoso@escola.com', 10, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '789.012.345-67', '(11) 97777-7777'),
(92, 'Tiago Lopes', 'FIS2023008', 'tiago.lopes@escola.com', 10, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '890.123.456-78', '(11) 98888-8888'),
(93, 'Vanessa Dias', 'FIS2023009', 'vanessa.dias@escola.com', 10, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '901.234.567-89', '(11) 99999-9999'),
(94, 'Wagner Castro', 'FIS2023010', 'wagner.castro@escola.com', 10, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '012.345.678-90', '(11) 90000-0000'),
(95, 'Alice Barbosa', 'PYT2023001', 'alice.barbosa@escola.com', 11, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '111.111.111-11', '(21) 91111-1111'),
(96, 'Bernardo Cunha', 'PYT2023002', 'bernardo.cunha@escola.com', 11, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '222.222.222-22', '(21) 92222-2222'),
(97, 'Clara Duarte', 'PYT2023003', 'clara.duarte@escola.com', 11, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '333.333.333-33', '(21) 93333-3333'),
(98, 'Diego Esteves', 'PYT2023004', 'diego.esteves@escola.com', 11, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '444.444.444-44', '(21) 94444-4444'),
(99, 'Elaine Fonseca', 'PYT2023005', 'elaine.fonseca@escola.com', 11, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '555.555.555-55', '(21) 95555-5555'),
(100, 'Fabio Gomes', 'PYT2023006', 'fabio.gomes@escola.com', 11, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '666.666.666-66', '(21) 96666-6666'),
(101, 'Giovana Henriques', 'PYT2023007', 'giovana.henriques@escola.com', 11, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '777.777.777-77', '(21) 97777-7777'),
(102, 'Hugo Inácio', 'PYT2023008', 'hugo.inacio@escola.com', 11, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '888.888.888-88', '(21) 98888-8888'),
(104, 'Julio Klein', 'PYT2023010', 'julio.klein@escola.com', 11, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '000.000.000-00', '(21) 90000-0000'),
(107, 'Renan Rodrigues Martins', '2516156', 'secretaria@escola.com', 4, 'secretaria@escola.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '88888888888', '31222222222');
DROP TRIGGER IF EXISTS `trg_insert_avaliacao`;
DELIMITER $$
CREATE TRIGGER `trg_insert_avaliacao` AFTER INSERT ON `alunos` FOR EACH ROW BEGIN
  INSERT INTO avaliacoes (aluno_id, curso_id, nota1, nota2, nota_final, faltas, status)
  VALUES (NEW.id, NEW.curso_id, 0, 0, 0, 0, 'Em andamento');
END
$$
DELIMITER ;

DROP TABLE IF EXISTS `avaliacoes`;
CREATE TABLE `avaliacoes` (
  `id` int(11) NOT NULL,
  `aluno_id` int(11) DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `nota1` decimal(5,2) DEFAULT NULL,
  `nota2` decimal(5,2) DEFAULT NULL,
  `nota_final` decimal(5,2) DEFAULT NULL,
  `faltas` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

TRUNCATE TABLE `avaliacoes`;
INSERT INTO `avaliacoes` (`id`, `aluno_id`, `curso_id`, `nota1`, `nota2`, `nota_final`, `faltas`, `status`) VALUES
(2, 2, 2, 9.00, 8.50, 8.75, 1, 'Aprovado'),
(3, 3, 3, 6.00, 7.50, 6.75, 4, 'Aprovado'),
(4, 4, 4, 5.00, 6.00, 5.50, 6, 'Recuperação'),
(6, 6, 6, 7.50, 8.00, 7.75, 3, 'Aprovado'),
(7, 7, 7, 9.50, 9.00, 9.25, 0, 'Aprovado'),
(8, 8, 8, 8.00, 8.50, 8.25, 2, 'Aprovado'),
(126, 75, 9, 3.70, 5.33, 4.52, 6, 'Reprovado'),
(127, 76, 9, 1.65, 1.66, 1.66, 3, 'Reprovado'),
(128, 77, 9, 1.73, 8.61, 5.17, 8, 'Reprovado'),
(129, 78, 9, 3.59, 4.27, 3.93, 0, 'Reprovado'),
(130, 79, 9, 0.24, 9.38, 4.81, 6, 'Reprovado'),
(131, 80, 9, 2.67, 4.86, 3.77, 6, 'Reprovado'),
(132, 81, 9, 6.84, 5.37, 6.11, 6, 'Aprovado'),
(133, 82, 9, 5.54, 8.70, 7.12, 7, 'Aprovado'),
(134, 83, 9, 8.34, 1.03, 4.69, 0, 'Reprovado'),
(135, 84, 9, 7.49, 7.10, 7.30, 3, 'Aprovado'),
(136, 85, 10, 3.82, 0.03, 1.93, 9, 'Reprovado'),
(137, 86, 10, 3.33, 0.61, 1.97, 3, 'Reprovado'),
(138, 87, 10, 3.41, 7.90, 5.66, 10, 'Reprovado'),
(139, 88, 10, 2.60, 5.22, 3.91, 9, 'Reprovado'),
(140, 89, 10, 5.80, 4.15, 4.98, 3, 'Reprovado'),
(141, 90, 10, 4.16, 0.86, 2.51, 1, 'Reprovado'),
(142, 91, 10, 6.41, 6.67, 6.54, 4, 'Aprovado'),
(143, 92, 10, 0.46, 0.04, 0.25, 9, 'Reprovado'),
(144, 93, 10, 4.00, 3.50, 3.75, 6, 'Reprovado'),
(145, 94, 10, 7.14, 9.11, 8.13, 4, 'Aprovado'),
(146, 95, 11, 3.33, 4.25, 3.79, 1, 'Reprovado'),
(147, 96, 11, 10.00, 3.82, 3.67, 9, 'Reprovado'),
(148, 97, 11, 1.38, 1.18, 1.28, 1, 'Reprovado'),
(149, 98, 11, 5.21, 0.82, 3.02, 9, 'Reprovado'),
(150, 99, 11, 9.79, 3.61, 6.70, 9, 'Aprovado'),
(151, 100, 11, 2.51, 6.57, 4.54, 5, 'Reprovado'),
(152, 101, 11, 6.80, 8.10, 7.45, 0, 'Aprovado'),
(153, 102, 11, 6.13, 0.40, 3.27, 3, 'Reprovado'),
(155, 104, 11, 9.31, 9.11, 9.21, 8, 'Aprovado'),
(172, 107, 4, 0.00, 0.00, 0.00, 0, 'Em andamento');

DROP TABLE IF EXISTS `cursos`;
CREATE TABLE `cursos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cargaHoraria` int(11) DEFAULT NULL,
  `professorId` int(11) DEFAULT NULL,
  `descricao` varchar(100) NOT NULL,
  `createUser` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

TRUNCATE TABLE `cursos`;
INSERT INTO `cursos` (`id`, `nome`, `cargaHoraria`, `professorId`, `descricao`, `createUser`) VALUES
(2, 'Português Avançado', 80, 2, 'Aperfeiçoamento em língua portuguesa', 'admin'),
(3, 'História do Brasil', 40, 3, 'Panorama da história brasileira', 'admin'),
(4, 'Geografia Mundial', 50, 4, 'Estudo dos países e continentes', 'admin'),
(6, 'Química Orgânica', 90, 6, 'Fundamentos da química orgânica', 'admin'),
(7, 'Biologia Celular', 70, 7, 'Estudo das células e seus componentes', 'admin'),
(8, 'Literatura Brasileira', 60, 8, 'Principais autores e obras nacionais', 'admin'),
(9, 'Inglês Intermediário', 80, 9, 'Desenvolvimento de conversação', 'admin'),
(10, 'Programação Web', 120, 10, 'Desenvolvimento de sites e aplicações', 'admin'),
(11, 'Matemática Avançada', 60, 14, 'Curso de matemática para ensino médio', 'admin');

DROP TABLE IF EXISTS `professores`;
CREATE TABLE `professores` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `cpf` varchar(15) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `createUser` varchar(100) NOT NULL,
  `senha` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

TRUNCATE TABLE `professores`;
INSERT INTO `professores` (`id`, `nome`, `email`, `cpf`, `telefone`, `createUser`, `senha`) VALUES
(2, 'Maria Oliveira', 'maria.oliveira@escola.com', '22233344455', '11987654322', 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(3, 'José Santos', 'jose.santos@escola.com', '33344455566', '11987654323', 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(4, 'Ana Pereira', 'ana.pereira@escola.com', '44455566677', '11987654324', 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(6, 'Fernanda Alves', 'fernanda.alves@escola.com', '66677788899', '11987654326', 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(7, 'Ricardo Nunes', 'ricardo.nunes@escola.com', '77788899900', '11987654327', 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(8, 'Patrícia Lima', 'patricia.lima@escola.com', '88899900011', '11987654328', 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(9, 'Marcos Souza', 'marcos.souza@escola.com', '99900011122', '11987654329', 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(10, 'Juliana Rocha', 'juliana.rocha@escola.com', '00011122233', '11987654320', 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(13, 'Adilson Lima da Silva', 'adilson.lima@professores.umc.br', '688.332.760-66', '11999999999', 'admin@escola.com', 'senha123'),
(14, 'Prof. João Silva a', 'joao.silva@escola.com', '123.456.789-00', '(11) 98765-4321', 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(16, 'Renan Rodrigues Martins', 'secretaria@escola.com', '231634654', '11990279949', 'secretaria@escola.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi');

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `createUser` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `cpf` varchar(15) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

TRUNCATE TABLE `usuarios`;
INSERT INTO `usuarios` (`id`, `usuario`, `senha`, `tipo`, `createUser`, `email`, `cpf`, `telefone`) VALUES
(3, 'prof2', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'professor', 'admin', 'prof2@escola.com', '34567890123', '11999999997'),
(5, 'aluno1', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'aluno', 'secretaria', 'aluno1@escola.com', '56789012345', '11999999995'),
(15, 'Manuel Bezerra de Melo', 'admin123', 'admin', 'admin@escola.com', 'manuel.bezerra@fundador.umc.br', '525.627.580-00', '5555555555'),
(17, 'onion', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'secretaria@escola.com', 'kaique@gmail.com.br', '21234867998', '11321654987');


ALTER TABLE `alunos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `curso_id` (`curso_id`);

ALTER TABLE `avaliacoes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_aluno_curso` (`aluno_id`,`curso_id`),
  ADD KEY `aluno_id` (`aluno_id`),
  ADD KEY `curso_id` (`curso_id`);

ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `professor_id` (`professorId`);

ALTER TABLE `professores`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `alunos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

ALTER TABLE `avaliacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

ALTER TABLE `cursos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

ALTER TABLE `professores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;


ALTER TABLE `alunos`
  ADD CONSTRAINT `alunos_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`);

ALTER TABLE `avaliacoes`
  ADD CONSTRAINT `avaliacoes_ibfk_1` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`),
  ADD CONSTRAINT `avaliacoes_ibfk_2` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`);

ALTER TABLE `cursos`
  ADD CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`professorId`) REFERENCES `professores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- Troca o delimitador temporariamente para permitir blocos BEGIN...END
DELIMITER //

-- TRIGGERS PARA ALUNOS
CREATE TRIGGER trg_hash_senha_alunos_insert
BEFORE INSERT ON alunos
FOR EACH ROW
BEGIN
    IF CHAR_LENGTH(NEW.senha) != 32 THEN
        SET NEW.senha = MD5(NEW.senha);
    END IF;
END;
//

CREATE TRIGGER trg_hash_senha_alunos_update
BEFORE UPDATE ON alunos
FOR EACH ROW
BEGIN
    IF CHAR_LENGTH(NEW.senha) != 32 THEN
        SET NEW.senha = MD5(NEW.senha);
    END IF;
END;
//

-- TRIGGERS PARA PROFESSORES
CREATE TRIGGER trg_hash_senha_professores_insert
BEFORE INSERT ON professores
FOR EACH ROW
BEGIN
    IF CHAR_LENGTH(NEW.senha) != 32 THEN
        SET NEW.senha = MD5(NEW.senha);
    END IF;
END;
//

CREATE TRIGGER trg_hash_senha_professores_update
BEFORE UPDATE ON professores
FOR EACH ROW
BEGIN
    IF CHAR_LENGTH(NEW.senha) != 32 THEN
        SET NEW.senha = MD5(NEW.senha);
    END IF;
END;
//

-- TRIGGERS PARA USUÁRIOS
CREATE TRIGGER trg_hash_senha_usuarios_insert
BEFORE INSERT ON usuarios
FOR EACH ROW
BEGIN
    IF CHAR_LENGTH(NEW.senha) != 32 THEN
        SET NEW.senha = MD5(NEW.senha);
    END IF;
END;
//

CREATE TRIGGER trg_hash_senha_usuarios_update
BEFORE UPDATE ON usuarios
FOR EACH ROW
BEGIN
    IF CHAR_LENGTH(NEW.senha) != 32 THEN
        SET NEW.senha = MD5(NEW.senha);
    END IF;
END;
//

-- Restaura o delimitador padrão
DELIMITER ;
