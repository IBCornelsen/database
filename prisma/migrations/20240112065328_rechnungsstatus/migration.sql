/*
  Warnings:

  - The values [OFFEN,BEZAHLT,STORNIERT] on the enum `Rechnungsstatus` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "Rechnungsstatus_new" AS ENUM ('open', 'canceled', 'pending', 'authorized', 'expired', 'failed', 'paid');
ALTER TABLE "rechnungen" ALTER COLUMN "status" TYPE "Rechnungsstatus_new" USING ("status"::text::"Rechnungsstatus_new");
ALTER TYPE "Rechnungsstatus" RENAME TO "Rechnungsstatus_old";
ALTER TYPE "Rechnungsstatus_new" RENAME TO "Rechnungsstatus";
DROP TYPE "Rechnungsstatus_old";
COMMIT;
