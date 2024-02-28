/*
  Warnings:

  - You are about to drop the `Recipe` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RecipeIngredient` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `RecipeIngredient` DROP FOREIGN KEY `RecipeIngredient_infoId_fkey`;

-- DropForeignKey
ALTER TABLE `RecipeIngredient` DROP FOREIGN KEY `RecipeIngredient_recipeId_fkey`;

-- DropTable
DROP TABLE `Recipe`;

-- DropTable
DROP TABLE `RecipeIngredient`;

-- CreateTable
CREATE TABLE `recipe` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `instructions` VARCHAR(191) NOT NULL,
    `time` INTEGER NOT NULL,
    `people` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `recipeIngredient` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `amountNeeded` INTEGER NOT NULL,
    `recipeId` INTEGER NOT NULL,
    `infoId` INTEGER NOT NULL,

    UNIQUE INDEX `recipeIngredient_recipeId_key`(`recipeId`),
    UNIQUE INDEX `recipeIngredient_infoId_key`(`infoId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `recipeIngredient` ADD CONSTRAINT `recipeIngredient_recipeId_fkey` FOREIGN KEY (`recipeId`) REFERENCES `recipe`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `recipeIngredient` ADD CONSTRAINT `recipeIngredient_infoId_fkey` FOREIGN KEY (`infoId`) REFERENCES `ingredientInfo`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
