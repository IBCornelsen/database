/*
  Warnings:

  - You are about to drop the `bedarfsausweis_wohnen` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "bedarfsausweis_wohnen" DROP CONSTRAINT "bedarfsausweis_wohnen_benutzer_id_fkey";

-- DropForeignKey
ALTER TABLE "bedarfsausweis_wohnen" DROP CONSTRAINT "bedarfsausweis_wohnen_gebaeude_stammdaten_id_fkey";

-- DropForeignKey
ALTER TABLE "bedarfsausweis_wohnen" DROP CONSTRAINT "bedarfsausweis_wohnen_rechnungen_id_fkey";

-- DropTable
DROP TABLE "bedarfsausweis_wohnen";

-- CreateTable
CREATE TABLE "BedarfsausweisWohnen" (
    "id" SERIAL NOT NULL,
    "uid" UUID NOT NULL DEFAULT gen_random_uuid(),
    "gebaeude_stammdaten_id" INTEGER NOT NULL,
    "benutzer_id" INTEGER NOT NULL,
    "rechnungen_id" INTEGER,
    "erstellungsdatum" TIMESTAMP(6),
    "ausstellgrund" "Ausstellgrund",
    "registriernummer" VARCHAR,
    "erledigt" BOOLEAN,
    "alternative_heizung" BOOLEAN,
    "alternative_warmwasser" BOOLEAN,
    "alternative_lueftung" BOOLEAN,
    "alternative_kuehlung" BOOLEAN,
    "anzahl_vollgeschosse" INTEGER,
    "geschosshoehe" DOUBLE PRECISION,
    "anzahl_gauben" INTEGER,
    "breite_gauben" DOUBLE PRECISION,
    "masse_a" DOUBLE PRECISION,
    "masse_b" DOUBLE PRECISION,
    "masse_c" DOUBLE PRECISION,
    "masse_d" DOUBLE PRECISION,
    "masse_e" DOUBLE PRECISION,
    "masse_f" DOUBLE PRECISION,
    "fensterflaeche_so_sw" DOUBLE PRECISION,
    "fensterflaeche_nw_no" DOUBLE PRECISION,
    "aussenwandflaeche_unbeheizt" DOUBLE PRECISION,
    "dachflaeche" DOUBLE PRECISION,
    "deckenflaeche" DOUBLE PRECISION,
    "dach_u_wert" DOUBLE PRECISION,
    "decke_u_wert" DOUBLE PRECISION,
    "aussenwand_flaeche" DOUBLE PRECISION,
    "aussenwand_u_wert" DOUBLE PRECISION,
    "fussboden_flaeche" DOUBLE PRECISION,
    "fussboden_u_wert" DOUBLE PRECISION,
    "volumen" DOUBLE PRECISION,
    "dicht" BOOLEAN,
    "fenster_flaeche_1" DOUBLE PRECISION,
    "fenster_art_1" DOUBLE PRECISION,
    "fenster_flaeche_2" DOUBLE PRECISION,
    "fenster_art_2" DOUBLE PRECISION,
    "dachfenster_flaeche" DOUBLE PRECISION,
    "dachfenster_art" DOUBLE PRECISION,
    "haustuer_flaeche" DOUBLE PRECISION,
    "haustuer_art" DOUBLE PRECISION,
    "dach_bauart" VARCHAR,
    "decke_bauart" VARCHAR,
    "dach_daemmung" DOUBLE PRECISION,
    "decke_daemmung" DOUBLE PRECISION,
    "aussenwand_daemmung" DOUBLE PRECISION,
    "boden_daemmung" DOUBLE PRECISION,
    "aussenwand_bauart" VARCHAR,
    "boden_bauart" VARCHAR,
    "warmwasser_verteilung" VARCHAR,
    "warmwasser_speicherung" VARCHAR,
    "warmwasser_erzeugung" VARCHAR,
    "heizung_zentral" BOOLEAN,
    "heizung_verteilung" VARCHAR,
    "heizung_speicherung" VARCHAR,
    "waerme_erzeugung_heizung" VARCHAR,
    "anteil_zusatzheizung" DOUBLE PRECISION,
    "kollektor_flaeche" DOUBLE PRECISION,
    "ausweisart" "Ausweisart" NOT NULL DEFAULT 'BedarfsausweisWohnen',

    CONSTRAINT "BedarfsausweisWohnen_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "BedarfsausweisWohnen" ADD CONSTRAINT "BedarfsausweisWohnen_benutzer_id_fkey" FOREIGN KEY ("benutzer_id") REFERENCES "benutzer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "BedarfsausweisWohnen" ADD CONSTRAINT "BedarfsausweisWohnen_gebaeude_stammdaten_id_fkey" FOREIGN KEY ("gebaeude_stammdaten_id") REFERENCES "gebaeude_stammdaten"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "BedarfsausweisWohnen" ADD CONSTRAINT "BedarfsausweisWohnen_rechnungen_id_fkey" FOREIGN KEY ("rechnungen_id") REFERENCES "rechnungen"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
