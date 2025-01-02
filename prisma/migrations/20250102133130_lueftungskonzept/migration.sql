/*
  Warnings:

  - The `lueftung` column on the `GebaeudeAufnahmeAllgemein` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- CreateEnum
CREATE TYPE "Lueftungskonzept" AS ENUM ('Fensterlueftung', 'Schachtlueftung', 'LueftungsanlageMitWaermerueckgewinnung', 'LueftungsanlageOhneWaermerueckgewinnung');

-- AlterTable
ALTER TABLE "GebaeudeAufnahmeAllgemein" DROP COLUMN "lueftung",
ADD COLUMN     "lueftung" "Lueftungskonzept";
