/*
  Warnings:

  - Added the required column `betrag` to the `rechnungen` table without a default value. This is not possible if the table is not empty.
  - Added the required column `status` to the `rechnungen` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "Rechnungsstatus" AS ENUM ('OFFEN', 'BEZAHLT', 'STORNIERT');

-- AlterTable
ALTER TABLE "rechnungen" ADD COLUMN     "betrag" DOUBLE PRECISION NOT NULL,
ADD COLUMN     "bezahlt_am" TIMESTAMP(3),
ADD COLUMN     "erstellt_am" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "status" "Rechnungsstatus" NOT NULL,
ADD COLUMN     "storniert_am" TIMESTAMP(3),
ADD COLUMN     "transaktions_referenz" VARCHAR;
