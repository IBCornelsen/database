/*
  Warnings:

  - You are about to alter the column `plz` on the `GebaeudeStammdaten` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(5)`.
  - You are about to alter the column `ort` on the `GebaeudeStammdaten` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - You are about to alter the column `adresse` on the `GebaeudeStammdaten` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(100)`.
  - A unique constraint covering the columns `[uid]` on the table `BedarfsausweisWohnen` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "GebaeudeStammdaten" ALTER COLUMN "plz" SET DATA TYPE VARCHAR(5),
ALTER COLUMN "ort" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "adresse" SET DATA TYPE VARCHAR(100);

-- CreateIndex
CREATE UNIQUE INDEX "BedarfsausweisWohnen_uid_key" ON "BedarfsausweisWohnen"("uid");
