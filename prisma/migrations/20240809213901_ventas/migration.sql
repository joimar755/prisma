/*
  Warnings:

  - You are about to alter the column `cantidad` on the `detalle` table. The data in that column could be lost. The data in that column will be cast from `Int` to `Double`.
  - You are about to alter the column `Subtotal` on the `detalle` table. The data in that column could be lost. The data in that column will be cast from `Int` to `Double`.
  - You are about to alter the column `total` on the `venta` table. The data in that column could be lost. The data in that column will be cast from `Int` to `Double`.

*/
-- AlterTable
ALTER TABLE `detalle` MODIFY `cantidad` DOUBLE NOT NULL,
    MODIFY `Subtotal` DOUBLE NOT NULL;

-- AlterTable
ALTER TABLE `venta` MODIFY `total` DOUBLE NOT NULL;
