/*
  Warnings:

  - You are about to drop the column `primaerfaktor_1` on the `GebaeudeAufnahmeAllgemein` table. All the data in the column will be lost.
  - You are about to drop the column `primaerfaktor_2` on the `GebaeudeAufnahmeAllgemein` table. All the data in the column will be lost.
  - You are about to drop the column `primaerfaktor_warmwasser_1` on the `GebaeudeAufnahmeAllgemein` table. All the data in the column will be lost.
  - You are about to drop the column `primaerfaktor_warmwasser_2` on the `GebaeudeAufnahmeAllgemein` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "GebaeudeAufnahmeAllgemein" DROP COLUMN "primaerfaktor_1",
DROP COLUMN "primaerfaktor_2",
DROP COLUMN "primaerfaktor_warmwasser_1",
DROP COLUMN "primaerfaktor_warmwasser_2",
ADD COLUMN     "boxpruefung" BOOLEAN DEFAULT false;
