-- DropForeignKey
ALTER TABLE `ingredientInfo` DROP FOREIGN KEY `ingredientInfo_ingredientId_fkey`;

-- AddForeignKey
ALTER TABLE `ingredientInfo` ADD CONSTRAINT `ingredientInfo_ingredientId_fkey` FOREIGN KEY (`ingredientId`) REFERENCES `ingredient`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
