/*
  Warnings:

  - You are about to drop the column `email` on the `referral` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `referral` table. All the data in the column will be lost.
  - You are about to drop the column `referredBy` on the `referral` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX `Referral_email_key` ON `referral`;

-- AlterTable
ALTER TABLE `referral` DROP COLUMN `email`,
    DROP COLUMN `name`,
    DROP COLUMN `referredBy`,
    ADD COLUMN `FriendEmail` VARCHAR(191) NOT NULL DEFAULT 'Unknown',
    ADD COLUMN `FriendName` VARCHAR(191) NOT NULL DEFAULT 'Unknown',
    ADD COLUMN `FriendNumber` VARCHAR(191) NOT NULL DEFAULT 'Unknown',
    ADD COLUMN `ReferredByMail` VARCHAR(191) NOT NULL DEFAULT 'Unknown',
    ADD COLUMN `ReferredByName` VARCHAR(191) NOT NULL DEFAULT 'Unknown',
    ADD COLUMN `ReferredByNumber` VARCHAR(191) NOT NULL DEFAULT 'Unknown';
