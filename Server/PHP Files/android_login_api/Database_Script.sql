
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `Vou Levar-te Comigo`
--
CREATE DATABASE IF NOT EXISTS `Vou_Levar_te_Comigo` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `Vou_Levar_te_Comigo`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id`     INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `unique_id`   VARCHAR(23) NOT NULL unique COMMENT 'NAO PERCEBO O PORQUE DE USAR AQUI UNIQUE',
  `username`    VARCHAR(30) NOT NULL,
  `email`       VARCHAR(256) NOT NULL UNIQUE COMMENT 'The maximum length is specified in RFC 5321',
  `password`    CHAR(64) NOT NULL COMMENT 'Saves hashed password',
  `salt`        CHAR(10) NOT NULL COMMENT 'NAO PERCEBO O PORQUE DE USAR UNICAMENTE 10 bytes',
  `created_at`  TIMESTAMP DEFAULT 0 NOT NULL COMMENT 'Incorrect table definition; there can be only one TIMESTAMP column with CURRENT_TIMESTAMP in DEFAULT or ON UPDATE clause. To solve this problem we must upgrade the mysql server version to 5.6.5.',
  `updated_at`  TIMESTAMP DEFAULT 0 ON UPDATE CURRENT_TIMESTAMP,
  `rsa_keypair` CHAR(23) DEFAULT 0 NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=latin1;;

/*
  InnoDB became the default storage engine since MySQL version 5.5. 
  The InnoDB table type brings many benefits of relational database
  management system such as ACID transaction, referential INTegrity,
  and crash recovery. In previous versions, MySQL used MyISAM as the
  default storage engine.
*/

--
-- Estrutura da tabela `tokens`
--

CREATE TABLE IF NOT EXISTS `tokens` (
  `token_id`  INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `owner_id`  INT(11) NOT NULL,
  `name`      VARCHAR(30) NOT NULL,
  `signature` VARCHAR(256) COMMENT 'ASSUMINDO QUE A CHAVE RSA QUE USAMOS TEM 2048 bits. We must use VARCHAR because Column length too big for column "signature" (max = 255); use BLOB or TEXT instead '
)ENGINE=InnoDB DEFAULT CHARSET=latin1;;

ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_fk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Estrutura da tabela `mensagens`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `message_id`         INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `token_id`           INT(11) NOT NULL,
  `message_to`         INT(11) NOT NULL,
  `message`            VARCHAR(256) NOT NULL,
  `AES_encryption_key` VARCHAR(300) COMMENT 'SE REALMENTE VAMOS ENCRIPTAR AS MENSAGENS E PRECISO VER O TAMANHO CORRETO DE UMA CHAVE AES'
)ENGINE=InnoDB DEFAULT CHARSET=latin1;;

ALTER TABLE `messages`
  ADD CONSTRAINT `mensagens_fk_1` FOREIGN KEY (`token_id`)   REFERENCES `tokens` (`token_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `messages`
  ADD CONSTRAINT `mensagens_fk_2` FOREIGN KEY (`message_to`) REFERENCES `users`  (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Estrutura da tabela `active users`
--

CREATE TABLE IF NOT EXISTS `active_users` (
  `user_id`  INT(11) NOT NULL,
  `ip`       CHAR(7) NOT NULL COMMENT 'IPV4 address (32 bits + . + . + .)',
  `time`     TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=latin1;;

ALTER TABLE `active_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Estrutura da tabela `jumps`
--

CREATE TABLE IF NOT EXISTS `jumps` (
  `trip_id`     INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `token_id`    INT(11) NOT NULL,
  `latitude`    FLOAT( 10, 6 ) NOT NULL ,
  `longitude`   FLOAT( 10, 6 ) NOT NULL,
  `receiver_id` INT(11) NOT NULL,
  `jump_time`   TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=latin1;;

ALTER TABLE `jumps`
  ADD CONSTRAINT `jumps_fk_1` FOREIGN KEY (`token_id`)    REFERENCES `tokens` (`token_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `jumps`
  ADD CONSTRAINT `jumps_fk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users`  (`user_id`)  ON DELETE CASCADE ON UPDATE CASCADE;

