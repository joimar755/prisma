/*
  Warnings:

  - Added the required column `ventas_id` to the `Detalle` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Detalle` ADD COLUMN `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `ventas_id` INTEGER NOT NULL;

-- CreateTable
CREATE TABLE `Ventas` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `total` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Detalle` ADD CONSTRAINT `Detalle_ventas_id_fkey` FOREIGN KEY (`ventas_id`) REFERENCES `Ventas`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
