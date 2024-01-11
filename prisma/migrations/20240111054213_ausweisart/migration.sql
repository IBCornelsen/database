/*
  Warnings:

  - The `ausweisart` column on the `VerbrauchsausweisWohnen` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- CreateEnum
CREATE TYPE "Ausweisart" AS ENUM ('VerbrauchsausweisWohnen', 'VerbrauchsausweisGewerbe', 'BedarfsausweisWohnen');

-- AlterTable
ALTER TABLE "VerbrauchsausweisWohnen" DROP COLUMN "ausweisart",
ADD COLUMN     "ausweisart" "Ausweisart" NOT NULL DEFAULT 'VerbrauchsausweisWohnen';
