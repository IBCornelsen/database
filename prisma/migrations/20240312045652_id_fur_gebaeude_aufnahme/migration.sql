/*
  Warnings:

  - You are about to drop the column `gebaeudeAufnahmeAllgemeinId` on the `Rechnung` table. All the data in the column will be lost.
  - Added the required column `gebaeude_aufnahme_allgemein_id` to the `Rechnung` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Rechnung" DROP CONSTRAINT "Rechnung_gebaeudeAufnahmeAllgemeinId_fkey";

-- AlterTable
ALTER TABLE "Rechnung" DROP COLUMN "gebaeudeAufnahmeAllgemeinId",
ADD COLUMN     "gebaeude_aufnahme_allgemein_id" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Rechnung" ADD CONSTRAINT "Rechnung_gebaeude_aufnahme_allgemein_id_fkey" FOREIGN KEY ("gebaeude_aufnahme_allgemein_id") REFERENCES "GebaeudeAufnahmeAllgemein"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
