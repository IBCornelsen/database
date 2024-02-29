/*
  Warnings:

  - You are about to drop the column `gebaeude_stammdaten_id` on the `Event` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Event" DROP CONSTRAINT "Event_gebaeude_stammdaten_id_fkey";

-- AlterTable
ALTER TABLE "Event" DROP COLUMN "gebaeude_stammdaten_id",
ADD COLUMN     "gebaeudeStammdatenId" INTEGER,
ADD COLUMN     "gebaeude_aufnahme_allgemein_id" INTEGER;

-- AlterTable
ALTER TABLE "VerbrauchsausweisWohnen" ALTER COLUMN "erstellungsdatum" SET DEFAULT CURRENT_TIMESTAMP;

-- AddForeignKey
ALTER TABLE "Event" ADD CONSTRAINT "Event_gebaeude_aufnahme_allgemein_id_fkey" FOREIGN KEY ("gebaeude_aufnahme_allgemein_id") REFERENCES "GebaeudeAufnahmeAllgemein"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Event" ADD CONSTRAINT "Event_gebaeudeStammdatenId_fkey" FOREIGN KEY ("gebaeudeStammdatenId") REFERENCES "GebaeudeStammdaten"("id") ON DELETE SET NULL ON UPDATE CASCADE;
