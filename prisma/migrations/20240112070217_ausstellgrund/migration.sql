/*
  Warnings:

  - The `ausstellgrund` column on the `VerbrauchsausweisWohnen` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `ausstellgrund` column on the `bedarfsausweis_wohnen` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- CreateEnum
CREATE TYPE "Ausstellgrund" AS ENUM ('Neubau', 'Vermietung', 'Verkauf', 'Modernisierung', 'Sonstiges');

-- AlterTable
ALTER TABLE "VerbrauchsausweisGewerbe" ADD COLUMN     "ausstellgrund" "Ausstellgrund";

-- AlterTable
ALTER TABLE "VerbrauchsausweisWohnen" DROP COLUMN "ausstellgrund",
ADD COLUMN     "ausstellgrund" "Ausstellgrund";

-- AlterTable
ALTER TABLE "bedarfsausweis_wohnen" DROP COLUMN "ausstellgrund",
ADD COLUMN     "ausstellgrund" "Ausstellgrund";
