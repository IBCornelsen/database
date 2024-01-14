/*
  Warnings:

  - Made the column `benutzer_id` on table `VerbrauchsausweisWohnen` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
CREATE SEQUENCE verbrauchsausweisgewerbe_id_seq;
ALTER TABLE "VerbrauchsausweisGewerbe" ADD COLUMN     "alternative_heizung" BOOLEAN,
ADD COLUMN     "alternative_kuehlung" BOOLEAN,
ADD COLUMN     "alternative_lueftung" BOOLEAN,
ADD COLUMN     "alternative_warmwasser" BOOLEAN,
ADD COLUMN     "anteil_kuehlung_1" DOUBLE PRECISION,
ADD COLUMN     "anteil_kuehlung_2" DOUBLE PRECISION,
ADD COLUMN     "anteil_warmwasser_1" DOUBLE PRECISION,
ADD COLUMN     "anteil_warmwasser_2" DOUBLE PRECISION,
ADD COLUMN     "brennstoff_1" VARCHAR(50),
ADD COLUMN     "brennstoff_2" VARCHAR(50),
ADD COLUMN     "einheit_1" VARCHAR(50),
ADD COLUMN     "einheit_2" VARCHAR(50),
ADD COLUMN     "erledigt" BOOLEAN,
ADD COLUMN     "erstellungsdatum" TIMESTAMP(6),
ADD COLUMN     "keller_beheizt" BOOLEAN,
ADD COLUMN     "kuehlung_enthalten" BOOLEAN,
ADD COLUMN     "registriernummer" VARCHAR,
ADD COLUMN     "strom_1" INTEGER,
ADD COLUMN     "strom_2" INTEGER,
ADD COLUMN     "strom_3" INTEGER,
ADD COLUMN     "stromverbrauch_enthaelt_beleuchtung" BOOLEAN,
ADD COLUMN     "stromverbrauch_enthaelt_heizung" BOOLEAN,
ADD COLUMN     "stromverbrauch_enthaelt_kuehlung" BOOLEAN,
ADD COLUMN     "stromverbrauch_enthaelt_lueftung" BOOLEAN,
ADD COLUMN     "stromverbrauch_enthaelt_sonstige" VARCHAR(50),
ADD COLUMN     "stromverbrauch_enthaelt_warmwasser" BOOLEAN,
ADD COLUMN     "verbrauch_1" INTEGER,
ADD COLUMN     "verbrauch_2" INTEGER,
ADD COLUMN     "verbrauch_3" INTEGER,
ADD COLUMN     "verbrauch_4" INTEGER,
ADD COLUMN     "verbrauch_5" INTEGER,
ADD COLUMN     "verbrauch_6" INTEGER,
ADD COLUMN     "warmwasser_enthalten" BOOLEAN,
ADD COLUMN     "wird_gekuehlt" BOOLEAN,
ADD COLUMN     "zusaetzliche_heizquelle" BOOLEAN,
ALTER COLUMN "id" SET DEFAULT nextval('verbrauchsausweisgewerbe_id_seq');
ALTER SEQUENCE verbrauchsausweisgewerbe_id_seq OWNED BY "VerbrauchsausweisGewerbe"."id";

-- AlterTable
ALTER TABLE "VerbrauchsausweisWohnen" ALTER COLUMN "benutzer_id" SET NOT NULL;
