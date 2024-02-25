/*
  Warnings:

  - You are about to drop the column `gebaeude_stammdaten_id` on the `BedarfsausweisWohnen` table. All the data in the column will be lost.
  - You are about to drop the column `gebaeude_stammdaten_id` on the `VerbrauchsausweisWohnen` table. All the data in the column will be lost.
  - You are about to drop the `gebaeude_stammdaten` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[gebaeudeaufnahme_allgemein_id]` on the table `BedarfsausweisWohnen` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[gebaeudeaufnahme_allgemein_id]` on the table `VerbrauchsausweisGewerbe` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[gebaeudeaufnahme_allgemein_id]` on the table `VerbrauchsausweisWohnen` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `gebaeudeaufnahme_allgemein_id` to the `BedarfsausweisWohnen` table without a default value. This is not possible if the table is not empty.
  - Added the required column `gebaeudeaufnahme_allgemein_id` to the `VerbrauchsausweisGewerbe` table without a default value. This is not possible if the table is not empty.
  - Added the required column `gebaeudeaufnahme_allgemein_id` to the `VerbrauchsausweisWohnen` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Anteilshaber" DROP CONSTRAINT "Anteilshaber_gebaeude_id_fkey";

-- DropForeignKey
ALTER TABLE "BedarfsausweisWohnen" DROP CONSTRAINT "BedarfsausweisWohnen_gebaeude_stammdaten_id_fkey";

-- DropForeignKey
ALTER TABLE "VerbrauchsausweisGewerbe" DROP CONSTRAINT "VerbrauchsausweisGewerbe_gebaeude_stammdaten_id_fkey";

-- DropForeignKey
ALTER TABLE "VerbrauchsausweisWohnen" DROP CONSTRAINT "VerbrauchsausweisWohnen_gebaeude_stammdaten_id_fkey";

-- DropForeignKey
ALTER TABLE "gebaeude_bilder" DROP CONSTRAINT "gebaeude_bilder_gebaeude_stammdaten_id_fkey";

-- DropForeignKey
ALTER TABLE "gebaeude_plaene" DROP CONSTRAINT "gebaeude_plaene_gebaeude_stammdaten_id_fkey";

-- DropForeignKey
ALTER TABLE "gebaeude_stammdaten" DROP CONSTRAINT "gebaeude_stammdaten_benutzer_id_fkey";

-- AlterTable
ALTER TABLE "BedarfsausweisWohnen" DROP COLUMN "gebaeude_stammdaten_id",
ADD COLUMN     "gebaeudeaufnahme_allgemein_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "VerbrauchsausweisGewerbe" ADD COLUMN     "gebaeudeaufnahme_allgemein_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "VerbrauchsausweisWohnen" DROP COLUMN "gebaeude_stammdaten_id",
ADD COLUMN     "gebaeudeaufnahme_allgemein_id" INTEGER NOT NULL;

-- DropTable
DROP TABLE "gebaeude_stammdaten";

-- CreateTable
CREATE TABLE "GebaeudeAufnahmeAllgemein" (
    "id" SERIAL NOT NULL,
    "uid" UUID NOT NULL DEFAULT gen_random_uuid(),
    "benutzer_id" INTEGER,
    "gebaeudetyp" VARCHAR,
    "gebaeudeteil" VARCHAR,
    "baujahr_gebaeude" INTEGER[],
    "baujahr_heizung" INTEGER[],
    "baujahr_klima" INTEGER[],
    "einheiten" INTEGER,
    "flaeche" INTEGER,
    "saniert" BOOLEAN,
    "keller" "Heizungsstatus",
    "dachgeschoss" "Heizungsstatus",
    "lueftung" VARCHAR(50),
    "kuehlung" VARCHAR(50),
    "leerstand" INTEGER,
    "alternative_heizung" BOOLEAN,
    "alternative_warmwasser" BOOLEAN,
    "alternative_kuehlung" BOOLEAN,
    "alternative_lueftung" BOOLEAN,
    "brennstoff_1" VARCHAR(50),
    "brennstoff_2" VARCHAR(50),
    "plz" VARCHAR(5),
    "ort" VARCHAR(50),
    "adresse" VARCHAR(100),
    "erledigt" BOOLEAN DEFAULT false,
    "erstellungsdatum" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
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
    "gebaeude_stammdaten_id" INTEGER NOT NULL,

    CONSTRAINT "GebaeudeAufnahmeAllgemein_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GebaeudeStammdaten" (
    "id" SERIAL NOT NULL,
    "uid" UUID NOT NULL DEFAULT gen_random_uuid(),
    "benutzer_id" INTEGER NOT NULL,
    "latitude" DOUBLE PRECISION NOT NULL,
    "longitude" DOUBLE PRECISION NOT NULL,
    "plz" TEXT NOT NULL,
    "ort" TEXT NOT NULL,
    "adresse" TEXT NOT NULL,

    CONSTRAINT "GebaeudeStammdaten_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "GebaeudeAufnahmeAllgemein_uid_key" ON "GebaeudeAufnahmeAllgemein"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "GebaeudeStammdaten_uid_key" ON "GebaeudeStammdaten"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "BedarfsausweisWohnen_gebaeudeaufnahme_allgemein_id_key" ON "BedarfsausweisWohnen"("gebaeudeaufnahme_allgemein_id");

-- CreateIndex
CREATE UNIQUE INDEX "VerbrauchsausweisGewerbe_gebaeudeaufnahme_allgemein_id_key" ON "VerbrauchsausweisGewerbe"("gebaeudeaufnahme_allgemein_id");

-- CreateIndex
CREATE UNIQUE INDEX "VerbrauchsausweisWohnen_gebaeudeaufnahme_allgemein_id_key" ON "VerbrauchsausweisWohnen"("gebaeudeaufnahme_allgemein_id");

-- AddForeignKey
ALTER TABLE "Anteilshaber" ADD CONSTRAINT "Anteilshaber_gebaeude_id_fkey" FOREIGN KEY ("gebaeude_id") REFERENCES "GebaeudeStammdaten"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "BedarfsausweisWohnen" ADD CONSTRAINT "BedarfsausweisWohnen_gebaeudeaufnahme_allgemein_id_fkey" FOREIGN KEY ("gebaeudeaufnahme_allgemein_id") REFERENCES "GebaeudeAufnahmeAllgemein"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "GebaeudeAufnahmeAllgemein" ADD CONSTRAINT "GebaeudeAufnahmeAllgemein_benutzer_id_fkey" FOREIGN KEY ("benutzer_id") REFERENCES "benutzer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "GebaeudeAufnahmeAllgemein" ADD CONSTRAINT "GebaeudeAufnahmeAllgemein_gebaeude_stammdaten_id_fkey" FOREIGN KEY ("gebaeude_stammdaten_id") REFERENCES "GebaeudeStammdaten"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "gebaeude_bilder" ADD CONSTRAINT "gebaeude_bilder_gebaeude_stammdaten_id_fkey" FOREIGN KEY ("gebaeude_stammdaten_id") REFERENCES "GebaeudeStammdaten"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "gebaeude_plaene" ADD CONSTRAINT "gebaeude_plaene_gebaeude_stammdaten_id_fkey" FOREIGN KEY ("gebaeude_stammdaten_id") REFERENCES "GebaeudeStammdaten"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "GebaeudeStammdaten" ADD CONSTRAINT "GebaeudeStammdaten_benutzer_id_fkey" FOREIGN KEY ("benutzer_id") REFERENCES "benutzer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VerbrauchsausweisGewerbe" ADD CONSTRAINT "VerbrauchsausweisGewerbe_gebaeudeaufnahme_allgemein_id_fkey" FOREIGN KEY ("gebaeudeaufnahme_allgemein_id") REFERENCES "GebaeudeAufnahmeAllgemein"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "VerbrauchsausweisWohnen" ADD CONSTRAINT "VerbrauchsausweisWohnen_gebaeudeaufnahme_allgemein_id_fkey" FOREIGN KEY ("gebaeudeaufnahme_allgemein_id") REFERENCES "GebaeudeAufnahmeAllgemein"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
