/*
  Warnings:

  - You are about to drop the column `ausweisart` on the `BedarfsausweisWohnen` table. All the data in the column will be lost.
  - You are about to drop the column `ausweisart` on the `VerbrauchsausweisGewerbe` table. All the data in the column will be lost.
  - You are about to drop the column `ausweisart` on the `VerbrauchsausweisWohnen` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "BedarfsausweisWohnen" DROP COLUMN "ausweisart";

-- AlterTable
ALTER TABLE "GebaeudeAufnahmeAllgemein" ADD COLUMN     "ausweisart" "Ausweisart";

-- AlterTable
ALTER TABLE "VerbrauchsausweisGewerbe" DROP COLUMN "ausweisart";

-- AlterTable
ALTER TABLE "VerbrauchsausweisWohnen" DROP COLUMN "ausweisart",
ADD COLUMN     "faktorKeller" DOUBLE PRECISION;
