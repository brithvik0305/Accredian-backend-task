-- CreateTable
CREATE TABLE `Referral` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `FriendName` VARCHAR(191) NOT NULL DEFAULT 'Unknown',
    `FriendMail` VARCHAR(191) NOT NULL DEFAULT 'Unknown',
    `FriendNumber` VARCHAR(191) NOT NULL DEFAULT 'Unknown',
    `ReferredByName` VARCHAR(191) NOT NULL DEFAULT 'Unknown',
    `ReferredByMail` VARCHAR(191) NOT NULL DEFAULT 'Unknown',
    `ReferredByNumber` VARCHAR(191) NOT NULL DEFAULT 'Unknown',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
