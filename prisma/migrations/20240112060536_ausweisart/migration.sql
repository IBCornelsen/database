/*
  Warnings:

  - The `ausweisart` column on the `bedarfsausweis_wohnen` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "VerbrauchsausweisGewerbe" ADD COLUMN     "ausweisart" "Ausweisart" NOT NULL DEFAULT 'VerbrauchsausweisGewerbe';

-- AlterTable
ALTER TABLE "bedarfsausweis_wohnen" DROP COLUMN "ausweisart",
ADD COLUMN     "ausweisart" "Ausweisart" NOT NULL DEFAULT 'BedarfsausweisWohnen';
