/*
  Warnings:

  - You are about to drop the column `empfaenger_zeile_1` on the `rechnungen` table. All the data in the column will be lost.
  - You are about to drop the column `empfaenger_zeile_2` on the `rechnungen` table. All the data in the column will be lost.
  - Added the required column `bezahlmethode` to the `rechnungen` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "Bezahlmethoden" AS ENUM ('PAYPAL', 'GIROPAY', 'SOFORT', 'KREDITKARTE', 'RECHNUNG');

-- AlterTable
ALTER TABLE "rechnungen" DROP COLUMN "empfaenger_zeile_1",
DROP COLUMN "empfaenger_zeile_2",
ADD COLUMN     "bezahlmethode" "Bezahlmethoden" NOT NULL,
ADD COLUMN     "email" VARCHAR,
ADD COLUMN     "empfaenger" VARCHAR,
ADD COLUMN     "telefon" VARCHAR,
ADD COLUMN     "versand_email" VARCHAR,
ADD COLUMN     "versand_empfaenger" VARCHAR,
ADD COLUMN     "versand_ort" VARCHAR,
ADD COLUMN     "versand_plz" VARCHAR,
ADD COLUMN     "versand_strasse" VARCHAR,
ADD COLUMN     "versand_telefon" VARCHAR,
ADD COLUMN     "versand_zusatzzeile" VARCHAR,
ADD COLUMN     "zusatzzeile" VARCHAR,
ALTER COLUMN "strasse" DROP NOT NULL,
ALTER COLUMN "strasse" SET DATA TYPE VARCHAR;

-- AddForeignKey
ALTER TABLE "RefreshTokens" ADD CONSTRAINT "RefreshTokens_uid_fkey" FOREIGN KEY ("uid") REFERENCES "benutzer"("uid") ON DELETE RESTRICT ON UPDATE CASCADE;
