/*
  Warnings:

  - You are about to drop the column `FriendEmail` on the `referral` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `referral` DROP COLUMN `FriendEmail`,
    ADD COLUMN `FriendMail` VARCHAR(191) NOT NULL DEFAULT 'Unknown';
