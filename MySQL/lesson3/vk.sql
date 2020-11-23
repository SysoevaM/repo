-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema vk
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vk
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vk` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `vk` ;

-- -----------------------------------------------------
-- Table `vk`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vk`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(245) NOT NULL COMMENT 'имя',
  `lastname` VARCHAR(245) NOT NULL COMMENT 'фамилия',
  `email` VARCHAR(245) NOT NULL,
  `phone` BIGINT NOT NULL COMMENT 'телефон',
  `password_hash` CHAR(64) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'пользователи';

CREATE UNIQUE INDEX `email_UNIQUE` ON `vk`.`users` (`email` ASC) VISIBLE;

CREATE UNIQUE INDEX `phone_UNIQUE` ON `vk`.`users` (`phone` ASC) VISIBLE;

CREATE INDEX `firstname_lastname_idx` ON `vk`.`users` (`lastname` ASC, `firstname` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `vk`.`communities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vk`.`communities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(245) NOT NULL,
  `admin_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vk`.`friend_requests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vk`.`friend_requests` (
  `from_user_id` INT NOT NULL,
  `to_user_id` INT NOT NULL,
  `status` TINYINT UNSIGNED NOT NULL COMMENT 'статус: 0 - запрос, 1 - подтвержден, 2 - отклонен',
  PRIMARY KEY (`from_user_id`, `to_user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `fk_friend_requests_users1_idx` ON `vk`.`friend_requests` (`from_user_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `vk`.`media_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vk`.`media_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(245) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vk`.`media`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vk`.`media` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `media_type_id` INT NOT NULL,
  `text` TEXT NULL DEFAULT NULL,
  `file` BLOB NULL DEFAULT NULL COMMENT '/files/img/01.jpg',
  `size` INT NULL DEFAULT NULL,
  `metadata` JSON NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vk`.`messages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vk`.`messages` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `from_user_id` INT NOT NULL,
  `to_user_id` INT NOT NULL,
  `text` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vk`.`photo_albums`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vk`.`photo_albums` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(245) NOT NULL,
  `decs` TEXT NULL DEFAULT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vk`.`photos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vk`.`photos` (
  `id` INT NOT NULL,
  `album_id` INT NOT NULL,
  `media_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vk`.`profiles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vk`.`profiles` (
  `users_id` INT NOT NULL,
  `gender` ENUM('m', 'f', 'x') NOT NULL,
  `birthday` DATE NOT NULL,
  `location` VARCHAR(245) NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`users_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `fk_profiles_users_idx` ON `vk`.`profiles` (`users_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `vk`.`users_communities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vk`.`users_communities` (
  `community_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`community_id`, `user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `fk_users_communities_communities1_idx` ON `vk`.`users_communities` (`community_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `vk`.`likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vk`.`likes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `from_user_id` INT NOT NULL,
  `to_user_id` INT NOT NULL,
  `message_id` INT NULL DEFAULT NULL,
  `media_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `fk_from_to_message_idx` ON `vk`.`likes` (`from_user_id` ASC, `to_user_id` ASC, `message_id` ASC) INVISIBLE;

CREATE UNIQUE INDEX `fk_from_to_idx` ON `vk`.`likes` (`from_user_id` ASC, `to_user_id` ASC) VISIBLE;

CREATE UNIQUE INDEX `fk_from_to_media_idx` ON `vk`.`likes` (`from_user_id` ASC, `to_user_id` ASC, `media_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
