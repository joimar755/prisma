/*
  Warnings:

  - You are about to drop the column `ventas_id` on the `Detalle` table. All the data in the column will be lost.
  - You are about to drop the `Ventas` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `ventaId` to the `Detalle` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Detalle` DROP FOREIGN KEY `Detalle_ventas_id_fkey`;

-- AlterTable
ALTER TABLE `Detalle` DROP COLUMN `ventas_id`,
    ADD COLUMN `ventaId` INTEGER NOT NULL;

-- DropTable
DROP TABLE `Ventas`;

-- CreateTable
CREATE TABLE `Venta` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `total` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE INDEX `ventaId` ON `Detalle`(`ventaId`);

-- AddForeignKey
ALTER TABLE `Detalle` ADD CONSTRAINT `Detalle_ventaId_fkey` FOREIGN KEY (`ventaId`) REFERENCES `Venta`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
