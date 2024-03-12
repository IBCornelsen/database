/*
  Warnings:

  - You are about to drop the column `erledigt` on the `BedarfsausweisWohnen` table. All the data in the column will be lost.
  - You are about to drop the column `erstellungsdatum` on the `BedarfsausweisWohnen` table. All the data in the column will be lost.
  - You are about to drop the column `rechnungen_id` on the `BedarfsausweisWohnen` table. All the data in the column will be lost.
  - You are about to drop the column `erledigt` on the `VerbrauchsausweisGewerbe` table. All the data in the column will be lost.
  - You are about to drop the column `erstellungsdatum` on the `VerbrauchsausweisGewerbe` table. All the data in the column will be lost.
  - You are about to drop the column `rechnungen_id` on the `VerbrauchsausweisGewerbe` table. All the data in the column will be lost.
  - You are about to drop the column `ausstellungsdatum` on the `VerbrauchsausweisWohnen` table. All the data in the column will be lost.
  - You are about to drop the column `erledigt` on the `VerbrauchsausweisWohnen` table. All the data in the column will be lost.
  - You are about to drop the column `erstellungsdatum` on the `VerbrauchsausweisWohnen` table. All the data in the column will be lost.
  - You are about to drop the column `rechnungen_id` on the `VerbrauchsausweisWohnen` table. All the data in the column will be lost.
  - You are about to drop the `rechnungen` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "BedarfsausweisWohnen" DROP CONSTRAINT "BedarfsausweisWohnen_rechnungen_id_fkey";

-- DropForeignKey
ALTER TABLE "VerbrauchsausweisGewerbe" DROP CONSTRAINT "VerbrauchsausweisGewerbe_rechnungen_id_fkey";

-- DropForeignKey
ALTER TABLE "VerbrauchsausweisWohnen" DROP CONSTRAINT "VerbrauchsausweisWohnen_rechnungen_id_fkey";

-- DropForeignKey
ALTER TABLE "rechnungen" DROP CONSTRAINT "rechnungen_benutzer_id_fkey";

-- AlterTable
ALTER TABLE "BedarfsausweisWohnen" DROP COLUMN "erledigt",
DROP COLUMN "erstellungsdatum",
DROP COLUMN "rechnungen_id";

-- AlterTable
ALTER TABLE "GebaeudeAufnahmeAllgemein" ADD COLUMN     "ausstellungsdatum" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "VerbrauchsausweisGewerbe" DROP COLUMN "erledigt",
DROP COLUMN "erstellungsdatum",
DROP COLUMN "rechnungen_id";

-- AlterTable
ALTER TABLE "VerbrauchsausweisWohnen" DROP COLUMN "ausstellungsdatum",
DROP COLUMN "erledigt",
DROP COLUMN "erstellungsdatum",
DROP COLUMN "rechnungen_id";

-- DropTable
DROP TABLE "rechnungen";

-- CreateTable
CREATE TABLE "Rechnung" (
    "id" SERIAL NOT NULL,
    "uid" UUID NOT NULL DEFAULT gen_random_uuid(),
    "benutzer_id" INTEGER NOT NULL,
    "empfaenger" VARCHAR,
    "strasse" VARCHAR,
    "plz" VARCHAR,
    "ort" VARCHAR,
    "zusatzzeile" VARCHAR,
    "telefon" VARCHAR,
    "email" VARCHAR,
    "abweichende_versand_adresse" BOOLEAN DEFAULT false,
    "versand_empfaenger" VARCHAR,
    "versand_strasse" VARCHAR,
    "versand_plz" VARCHAR,
    "versand_ort" VARCHAR,
    "versand_zusatzzeile" VARCHAR,
    "bezahlmethode" "Bezahlmethoden" NOT NULL,
    "status" "Rechnungsstatus" NOT NULL,
    "services" "Service"[],
    "betrag" DOUBLE PRECISION NOT NULL,
    "erstellt_am" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "bezahlt_am" TIMESTAMP(3),
    "storniert_am" TIMESTAMP(3),
    "transaktions_referenz" VARCHAR,
    "gebaeudeAufnahmeAllgemeinId" INTEGER NOT NULL,

    CONSTRAINT "Rechnung_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Rechnung_uid_key" ON "Rechnung"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "Rechnung_transaktions_referenz_key" ON "Rechnung"("transaktions_referenz");

-- AddForeignKey
ALTER TABLE "Rechnung" ADD CONSTRAINT "Rechnung_benutzer_id_fkey" FOREIGN KEY ("benutzer_id") REFERENCES "benutzer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Rechnung" ADD CONSTRAINT "Rechnung_gebaeudeAufnahmeAllgemeinId_fkey" FOREIGN KEY ("gebaeudeAufnahmeAllgemeinId") REFERENCES "GebaeudeAufnahmeAllgemein"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
