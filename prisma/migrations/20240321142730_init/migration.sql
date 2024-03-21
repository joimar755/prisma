/*
  Warnings:

  - You are about to drop the column `Detalle_id` on the `product` table. All the data in the column will be lost.
  - Added the required column `product_id` to the `Detalle` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `product` DROP FOREIGN KEY `Product_Detalle_id_fkey`;

-- AlterTable
ALTER TABLE `detalle` ADD COLUMN `product_id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `product` DROP COLUMN `Detalle_id`;

-- AddForeignKey
ALTER TABLE `Detalle` ADD CONSTRAINT `Detalle_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `Product`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
