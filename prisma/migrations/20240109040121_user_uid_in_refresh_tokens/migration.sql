/*
  Warnings:

  - Added the required column `uid` to the `RefreshTokens` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "RefreshTokens" ADD COLUMN     "uid" UUID NOT NULL;
