/*
  Warnings:

  - You are about to drop the column `gebaeude_id` on the `Anteilshaber` table. All the data in the column will be lost.
  - You are about to drop the column `gebaeudeaufnahme_allgemein_id` on the `BedarfsausweisWohnen` table. All the data in the column will be lost.
  - You are about to drop the column `gebaeude_aufnahme_allgemein_id` on the `Event` table. All the data in the column will be lost.
  - You are about to drop the column `gebaeude_aufnahme_allgemein_id` on the `Rechnung` table. All the data in the column will be lost.
  - You are about to drop the column `gebaeudeaufnahme_allgemein_id` on the `VerbrauchsausweisGewerbe` table. All the data in the column will be lost.
  - You are about to drop the column `gebaeudeaufnahme_allgemein_id` on the `VerbrauchsausweisWohnen` table. All the data in the column will be lost.
  - You are about to drop the column `gebaeude_stammdaten_id` on the `gebaeude_bilder` table. All the data in the column will be lost.
  - You are about to drop the `GebaeudeAufnahmeAllgemein` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `GebaeudeStammdaten` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `gebaeude_plaene` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[aufnahme_id]` on the table `BedarfsausweisWohnen` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[aufnahme_id]` on the table `VerbrauchsausweisGewerbe` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[aufnahme_id]` on the table `VerbrauchsausweisWohnen` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `objekt_id` to the `Anteilshaber` table without a default value. This is not possible if the table is not empty.
  - Added the required column `aufnahme_id` to the `BedarfsausweisWohnen` table without a default value. This is not possible if the table is not empty.
  - Added the required column `aufnahme_id` to the `Event` table without a default value. This is not possible if the table is not empty.
  - Added the required column `aufnahme_id` to the `Rechnung` table without a default value. This is not possible if the table is not empty.
  - Added the required column `aufnahme_id` to the `VerbrauchsausweisGewerbe` table without a default value. This is not possible if the table is not empty.
  - Added the required column `aufnahme_id` to the `VerbrauchsausweisWohnen` table without a default value. This is not possible if the table is not empty.
  - Added the required column `objekt_id` to the `gebaeude_bilder` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Anteilshaber" DROP CONSTRAINT "Anteilshaber_gebaeude_id_fkey";

-- DropForeignKey
ALTER TABLE "BedarfsausweisWohnen" DROP CONSTRAINT "BedarfsausweisWohnen_gebaeudeaufnahme_allgemein_id_fkey";

-- DropForeignKey
ALTER TABLE "Event" DROP CONSTRAINT "Event_gebaeude_aufnahme_allgemein_id_fkey";

-- DropForeignKey
ALTER TABLE "GebaeudeAufnahmeAllgemein" DROP CONSTRAINT "GebaeudeAufnahmeAllgemein_benutzer_id_fkey";

-- DropForeignKey
ALTER TABLE "GebaeudeAufnahmeAllgemein" DROP CONSTRAINT "GebaeudeAufnahmeAllgemein_gebaeude_stammdaten_id_fkey";

-- DropForeignKey
ALTER TABLE "GebaeudeStammdaten" DROP CONSTRAINT "GebaeudeStammdaten_benutzer_id_fkey";

-- DropForeignKey
ALTER TABLE "Rechnung" DROP CONSTRAINT "Rechnung_gebaeude_aufnahme_allgemein_id_fkey";

-- DropForeignKey
ALTER TABLE "VerbrauchsausweisGewerbe" DROP CONSTRAINT "VerbrauchsausweisGewerbe_gebaeudeaufnahme_allgemein_id_fkey";

-- DropForeignKey
ALTER TABLE "VerbrauchsausweisWohnen" DROP CONSTRAINT "VerbrauchsausweisWohnen_gebaeudeaufnahme_allgemein_id_fkey";

-- DropForeignKey
ALTER TABLE "gebaeude_bilder" DROP CONSTRAINT "gebaeude_bilder_gebaeude_stammdaten_id_fkey";

-- DropForeignKey
ALTER TABLE "gebaeude_plaene" DROP CONSTRAINT "gebaeude_plaene_gebaeude_stammdaten_id_fkey";

-- DropIndex
DROP INDEX "BedarfsausweisWohnen_gebaeudeaufnahme_allgemein_id_key";

-- DropIndex
DROP INDEX "VerbrauchsausweisGewerbe_gebaeudeaufnahme_allgemein_id_key";

-- DropIndex
DROP INDEX "VerbrauchsausweisWohnen_gebaeudeaufnahme_allgemein_id_key";

-- AlterTable
ALTER TABLE "Anteilshaber" DROP COLUMN "gebaeude_id",
ADD COLUMN     "objekt_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "BedarfsausweisWohnen" DROP COLUMN "gebaeudeaufnahme_allgemein_id",
ADD COLUMN     "aufnahme_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Event" DROP COLUMN "gebaeude_aufnahme_allgemein_id",
ADD COLUMN     "aufnahme_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Rechnung" DROP COLUMN "gebaeude_aufnahme_allgemein_id",
ADD COLUMN     "aufnahme_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "VerbrauchsausweisGewerbe" DROP COLUMN "gebaeudeaufnahme_allgemein_id",
ADD COLUMN     "aufnahme_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "VerbrauchsausweisWohnen" DROP COLUMN "gebaeudeaufnahme_allgemein_id",
ADD COLUMN     "aufnahme_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "gebaeude_bilder" DROP COLUMN "gebaeude_stammdaten_id",
ADD COLUMN     "objekt_id" INTEGER NOT NULL;

-- DropTable
DROP TABLE "GebaeudeAufnahmeAllgemein";

-- DropTable
DROP TABLE "GebaeudeStammdaten";

-- DropTable
DROP TABLE "gebaeude_plaene";

-- CreateTable
CREATE TABLE "Aufnahme" (
    "id" SERIAL NOT NULL,
    "uid" UUID NOT NULL DEFAULT gen_random_uuid(),
    "benutzer_id" INTEGER,
    "ausweisart" "Ausweisart",
    "gebaeudetyp" VARCHAR,
    "gebaeudeteil" VARCHAR,
    "baujahr_gebaeude" INTEGER[],
    "baujahr_heizung" INTEGER[],
    "baujahr_klima" INTEGER[],
    "einheiten" INTEGER,
    "flaeche" INTEGER,
    "nutzflaeche" INTEGER,
    "saniert" BOOLEAN,
    "keller" "Heizungsstatus",
    "dachgeschoss" "Heizungsstatus",
    "lueftung" "Lueftungskonzept",
    "kuehlung" VARCHAR(50),
    "leerstand" INTEGER,
    "alternative_heizung" BOOLEAN,
    "alternative_warmwasser" BOOLEAN,
    "alternative_lueftung" BOOLEAN,
    "alternative_kuehlung" BOOLEAN,
    "brennstoff_1" VARCHAR(50),
    "brennstoff_2" VARCHAR(50),
    "storniert" BOOLEAN DEFAULT false,
    "erledigt" BOOLEAN DEFAULT false,
    "bestellt" BOOLEAN DEFAULT false,
    "zurueckgestellt" BOOLEAN DEFAULT false,
    "prueftext" VARCHAR(1000),
    "boxpruefung" BOOLEAN DEFAULT false,
    "energieeffizienzklasse" VARCHAR(5),
    "erstellungsdatum" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "ausstellungsdatum" TIMESTAMP(3),
    "zentralheizung" BOOLEAN,
    "solarsystem_warmwasser" BOOLEAN,
    "warmwasser_rohre_gedaemmt" BOOLEAN,
    "niedertemperatur_kessel" BOOLEAN,
    "brennwert_kessel" BOOLEAN,
    "heizungsrohre_gedaemmt" BOOLEAN,
    "standard_kessel" BOOLEAN,
    "waermepumpe" BOOLEAN,
    "raum_temperatur_regler" BOOLEAN,
    "photovoltaik" BOOLEAN,
    "durchlauf_erhitzer" BOOLEAN,
    "einzelofen" BOOLEAN,
    "zirkulation" BOOLEAN,
    "einfach_verglasung" BOOLEAN,
    "dreifach_verglasung" BOOLEAN,
    "fenster_teilweise_undicht" BOOLEAN,
    "doppel_verglasung" BOOLEAN,
    "fenster_dicht" BOOLEAN,
    "rolllaeden_kaesten_gedaemmt" BOOLEAN,
    "isolier_verglasung" BOOLEAN,
    "tueren_undicht" BOOLEAN,
    "tueren_dicht" BOOLEAN,
    "dachgeschoss_gedaemmt" BOOLEAN,
    "keller_decke_gedaemmt" BOOLEAN,
    "keller_wand_gedaemmt" BOOLEAN,
    "aussenwand_gedaemmt" BOOLEAN,
    "oberste_geschossdecke_gedaemmt" BOOLEAN,
    "aussenwand_min_12cm_gedaemmt" BOOLEAN,
    "dachgeschoss_min_12cm_gedaemmt" BOOLEAN,
    "oberste_geschossdecke_min_12cm_gedaemmt" BOOLEAN,
    "objekt_id" INTEGER NOT NULL,

    CONSTRAINT "Aufnahme_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GebaeudePlaene" (
    "id" SERIAL NOT NULL,
    "uid" UUID NOT NULL DEFAULT gen_random_uuid(),
    "objekt_id" INTEGER NOT NULL,

    CONSTRAINT "GebaeudePlaene_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Objekt" (
    "id" SERIAL NOT NULL,
    "uid" UUID NOT NULL DEFAULT gen_random_uuid(),
    "benutzer_id" INTEGER,
    "latitude" DOUBLE PRECISION,
    "longitude" DOUBLE PRECISION,
    "plz" VARCHAR(5),
    "ort" VARCHAR(50),
    "adresse" VARCHAR(100),

    CONSTRAINT "Objekt_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Aufnahme_uid_key" ON "Aufnahme"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "GebaeudePlaene_uid_key" ON "GebaeudePlaene"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "Objekt_uid_key" ON "Objekt"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "BedarfsausweisWohnen_aufnahme_id_key" ON "BedarfsausweisWohnen"("aufnahme_id");

-- CreateIndex
CREATE UNIQUE INDEX "VerbrauchsausweisGewerbe_aufnahme_id_key" ON "VerbrauchsausweisGewerbe"("aufnahme_id");

-- CreateIndex
CREATE UNIQUE INDEX "VerbrauchsausweisWohnen_aufnahme_id_key" ON "VerbrauchsausweisWohnen"("aufnahme_id");

-- AddForeignKey
ALTER TABLE "Anteilshaber" ADD CONSTRAINT "Anteilshaber_objekt_id_fkey" FOREIGN KEY ("objekt_id") REFERENCES "Objekt"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Aufnahme" ADD CONSTRAINT "Aufnahme_benutzer_id_fkey" FOREIGN KEY ("benutzer_id") REFERENCES "benutzer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Aufnahme" ADD CONSTRAINT "Aufnahme_objekt_id_fkey" FOREIGN KEY ("objekt_id") REFERENCES "Objekt"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "BedarfsausweisWohnen" ADD CONSTRAINT "BedarfsausweisWohnen_aufnahme_id_fkey" FOREIGN KEY ("aufnahme_id") REFERENCES "Aufnahme"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Event" ADD CONSTRAINT "Event_aufnahme_id_fkey" FOREIGN KEY ("aufnahme_id") REFERENCES "Aufnahme"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "gebaeude_bilder" ADD CONSTRAINT "gebaeude_bilder_objekt_id_fkey" FOREIGN KEY ("objekt_id") REFERENCES "Objekt"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "GebaeudePlaene" ADD CONSTRAINT "GebaeudePlaene_objekt_id_fkey" FOREIGN KEY ("objekt_id") REFERENCES "Objekt"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Objekt" ADD CONSTRAINT "Objekt_benutzer_id_fkey" FOREIGN KEY ("benutzer_id") REFERENCES "benutzer"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rechnung" ADD CONSTRAINT "Rechnung_aufnahme_id_fkey" FOREIGN KEY ("aufnahme_id") REFERENCES "Aufnahme"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "VerbrauchsausweisGewerbe" ADD CONSTRAINT "VerbrauchsausweisGewerbe_aufnahme_id_fkey" FOREIGN KEY ("aufnahme_id") REFERENCES "Aufnahme"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "VerbrauchsausweisWohnen" ADD CONSTRAINT "VerbrauchsausweisWohnen_aufnahme_id_fkey" FOREIGN KEY ("aufnahme_id") REFERENCES "Aufnahme"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
