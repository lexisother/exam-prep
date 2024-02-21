-- CreateTable
CREATE TABLE `ingredient` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `amount` INTEGER NOT NULL,
    `archived` BOOLEAN NOT NULL,
    `expirationDate` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ingredientInfo` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `unit` VARCHAR(191) NOT NULL,
    `calories` INTEGER NOT NULL,
    `ingredientId` INTEGER NOT NULL,

    UNIQUE INDEX `ingredientInfo_ingredientId_key`(`ingredientId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `ingredientInfo` ADD CONSTRAINT `ingredientInfo_ingredientId_fkey` FOREIGN KEY (`ingredientId`) REFERENCES `ingredient`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
