/*
  Warnings:

  - Added the required column `email` to the `Tickets` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Tickets" ADD COLUMN     "email" TEXT NOT NULL;
