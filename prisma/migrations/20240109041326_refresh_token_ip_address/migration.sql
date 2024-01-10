/*
  Warnings:

  - Added the required column `ip` to the `RefreshTokens` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "RefreshTokens" ADD COLUMN     "ip" TEXT NOT NULL;
