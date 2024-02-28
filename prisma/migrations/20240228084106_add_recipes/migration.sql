-- CreateTable
CREATE TABLE `Recipe` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RecipeIngredient` (
    `recipeId` INTEGER NOT NULL,
    `infoId` INTEGER NOT NULL,

    UNIQUE INDEX `RecipeIngredient_recipeId_key`(`recipeId`),
    UNIQUE INDEX `RecipeIngredient_infoId_key`(`infoId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `RecipeIngredient` ADD CONSTRAINT `RecipeIngredient_recipeId_fkey` FOREIGN KEY (`recipeId`) REFERENCES `Recipe`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RecipeIngredient` ADD CONSTRAINT `RecipeIngredient_infoId_fkey` FOREIGN KEY (`infoId`) REFERENCES `ingredientInfo`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
