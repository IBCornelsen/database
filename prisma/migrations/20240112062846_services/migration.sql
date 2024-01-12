-- CreateEnum
CREATE TYPE "Service" AS ENUM ('Telefonberatung', 'Aushang', 'Qualitaetsdruck', 'SameDay');

-- AlterTable
ALTER TABLE "rechnungen" ADD COLUMN     "services" "Service"[];
