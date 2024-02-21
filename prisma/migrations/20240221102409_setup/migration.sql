-- CreateTable
CREATE TABLE `Ingredient` (
    `id` INTEGER NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `unit` VARCHAR(191) NOT NULL,
    `calories` INTEGER NOT NULL,

    UNIQUE INDEX `Ingredient_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
