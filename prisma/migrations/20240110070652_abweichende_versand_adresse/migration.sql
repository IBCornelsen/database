/*
  Warnings:

  - You are about to drop the column `versand_email` on the `rechnungen` table. All the data in the column will be lost.
  - You are about to drop the column `versand_telefon` on the `rechnungen` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "rechnungen" DROP COLUMN "versand_email",
DROP COLUMN "versand_telefon",
ADD COLUMN     "abweichende_versand_adresse" BOOLEAN NOT NULL DEFAULT false;
