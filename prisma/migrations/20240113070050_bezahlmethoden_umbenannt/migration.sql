/*
  Warnings:

  - The values [PAYPAL,GIROPAY,SOFORT,KREDITKARTE,RECHNUNG] on the enum `Bezahlmethoden` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "Bezahlmethoden_new" AS ENUM ('paypal', 'giropay', 'sofort', 'creditcard', 'rechnung');
ALTER TABLE "rechnungen" ALTER COLUMN "bezahlmethode" TYPE "Bezahlmethoden_new" USING ("bezahlmethode"::text::"Bezahlmethoden_new");
ALTER TYPE "Bezahlmethoden" RENAME TO "Bezahlmethoden_old";
ALTER TYPE "Bezahlmethoden_new" RENAME TO "Bezahlmethoden";
DROP TYPE "Bezahlmethoden_old";
COMMIT;
