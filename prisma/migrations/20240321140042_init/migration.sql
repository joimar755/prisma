/*
  Warnings:

  - Added the required column `Detalle_id` to the `Product` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `product` ADD COLUMN `Detalle_id` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `Product` ADD CONSTRAINT `Product_Detalle_id_fkey` FOREIGN KEY (`Detalle_id`) REFERENCES `Detalle`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
