/*
  Warnings:

  - You are about to drop the column `description` on the `product` table. All the data in the column will be lost.
  - You are about to drop the column `image` on the `product` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[name]` on the table `Product` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `Subtotal` to the `Detalle` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cantidad` to the `Detalle` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Stock` to the `Product` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `detalle` ADD COLUMN `Subtotal` INTEGER NOT NULL,
    ADD COLUMN `cantidad` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `product` DROP COLUMN `description`,
    DROP COLUMN `image`,
    ADD COLUMN `Stock` INTEGER NOT NULL;

-- CreateTable
CREATE TABLE `Users` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Users_name_key`(`name`),
    UNIQUE INDEX `Users_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `Product_name_key` ON `Product`(`name`);
