/*
  Warnings:

  - You are about to drop the column `gebaeude_stammdaten_id` on the `VerbrauchsausweisGewerbe` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "GebaeudeStammdaten" DROP CONSTRAINT "GebaeudeStammdaten_benutzer_id_fkey";

-- AlterTable
ALTER TABLE "BedarfsausweisWohnen" ALTER COLUMN "benutzer_id" DROP NOT NULL;

-- AlterTable
ALTER TABLE "GebaeudeStammdaten" ALTER COLUMN "benutzer_id" DROP NOT NULL;

-- AlterTable
ALTER TABLE "VerbrauchsausweisGewerbe" DROP COLUMN "gebaeude_stammdaten_id",
ALTER COLUMN "benutzer_id" DROP NOT NULL;

-- AlterTable
ALTER TABLE "VerbrauchsausweisWohnen" ALTER COLUMN "benutzer_id" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "GebaeudeStammdaten" ADD CONSTRAINT "GebaeudeStammdaten_benutzer_id_fkey" FOREIGN KEY ("benutzer_id") REFERENCES "benutzer"("id") ON DELETE SET NULL ON UPDATE CASCADE;
