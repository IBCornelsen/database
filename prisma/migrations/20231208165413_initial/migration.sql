-- CreateTable
CREATE TABLE "Postleitzahlen" (
    "id" INTEGER NOT NULL,

    CONSTRAINT "Postleitzahlen_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "adressen" (
    "id" SERIAL NOT NULL,
    "benutzer_id" INTEGER NOT NULL,
    "empfaenger_zeile_1" VARCHAR NOT NULL,
    "empfaenger_zeile_2" VARCHAR,
    "strasse" VARCHAR(100) NOT NULL,
    "plz" VARCHAR(5) NOT NULL,
    "ort" VARCHAR(50) NOT NULL,
    "geolocation" VARCHAR,
    "uid" UUID DEFAULT gen_random_uuid(),

    CONSTRAINT "adressen_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "anteilshaber" (
    "id" SERIAL NOT NULL,
    "benutzer_id" INTEGER NOT NULL,
    "gebaeude_id" INTEGER NOT NULL,
    "rolle" VARCHAR,
    "privilegien" BIGINT,
    "uid" UUID,

    CONSTRAINT "anteilshaber_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "bedarfsausweis_wohnen" (
    "id" SERIAL NOT NULL,
    "uid" UUID NOT NULL DEFAULT gen_random_uuid(),
    "gebaeude_stammdaten_id" INTEGER NOT NULL,
    "benutzer_id" INTEGER NOT NULL,
    "rechnungen_id" INTEGER,
    "ausweisart" VARCHAR NOT NULL,
    "erstellungsdatum" TIMESTAMP(6),
    "ausstellgrund" VARCHAR NOT NULL,
    "registriernummer" VARCHAR,
    "erledigt" BOOLEAN,
    "saniert" BOOLEAN,
    "baujahr" INTEGER[],
    "einheiten" INTEGER,
    "wohnflaeche" INTEGER,
    "keller_beheizt" BOOLEAN,
    "dachgeschoss_beheizt" INTEGER,
    "lueftungskonzept" VARCHAR,
    "leerstand" REAL,
    "versorgungssysteme" INTEGER,
    "fenster_dach" INTEGER,
    "energiequelle_2_nutzung" INTEGER,
    "daemmung" INTEGER,
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
    "vanw_stromverbrauch_enthalten" DOUBLE PRECISION,
    "wird_gekuehlt" BOOLEAN,

    CONSTRAINT "bedarfsausweis_wohnen_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "benutzer" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(50),
    "vorname" VARCHAR(50),
    "email" VARCHAR(255) NOT NULL,
    "passwort" VARCHAR(255) NOT NULL,
    "profilbild" VARCHAR,
    "benutzer_adresse_id" INTEGER,
    "rechnung_adresse_id" INTEGER,
    "versand_adresse_id" INTEGER,
    "uid" UUID,

    CONSTRAINT "benutzer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "documenttemplates" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "shortdescription" VARCHAR(100) NOT NULL,
    "longdescription" VARCHAR(5000) NOT NULL,
    "user_id" INTEGER NOT NULL,
    "is_private" BOOLEAN NOT NULL DEFAULT true,
    "documenttype" INTEGER NOT NULL,
    "filename" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PK_DOCUMENTTEMPLATES" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "documenttypes" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "shortdescription" VARCHAR(100) NOT NULL,
    "longdescription" VARCHAR(5000) NOT NULL,

    CONSTRAINT "PK_DOCUMENTTYPES" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gebaeude_bilder" (
    "id" SERIAL NOT NULL,
    "gebaeude_stammdaten_id" INTEGER NOT NULL,
    "kategorie" VARCHAR NOT NULL,
    "uid" UUID NOT NULL DEFAULT gen_random_uuid(),

    CONSTRAINT "gebaeude_bilder_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gebaeude_plaene" (
    "id" SERIAL NOT NULL,
    "gebaeude_stammdaten_id" INTEGER NOT NULL,
    "uid" UUID NOT NULL,

    CONSTRAINT "gebaeude_plaene_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gebaeude_stammdaten" (
    "id" SERIAL NOT NULL,
    "uid" UUID NOT NULL DEFAULT gen_random_uuid(),
    "benutzer_id" INTEGER,
    "gebaeude_adresse_id" INTEGER,
    "gebaeudetyp" VARCHAR,
    "gebaeudeteil" VARCHAR,
    "baujahr_gebaeude" INTEGER[],
    "baujahr_heizung" VARCHAR,
    "baujahr_klima" VARCHAR,
    "einheiten" INTEGER,
    "flaeche" INTEGER,
    "saniert" BOOLEAN,
    "keller" INTEGER,
    "dachgeschoss" INTEGER,
    "lueftung" VARCHAR(50),
    "kuehlung" VARCHAR(50),
    "leerstand" INTEGER,

    CONSTRAINT "gebaeude_stammdaten_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "klimafaktoren" (
    "zip" VARCHAR(5),
    "d_02_2008" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_03_2008" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_04_2008" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_05_2008" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_06_2008" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_07_2008" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_08_2008" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_09_2008" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_10_2008" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_11_2008" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_12_2008" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_01_2009" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_02_2009" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_03_2009" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_04_2009" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_05_2009" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_06_2009" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_07_2009" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_08_2009" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_09_2009" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_10_2009" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_11_2009" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_12_2009" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_01_2010" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_02_2010" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_03_2010" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_04_2010" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_05_2010" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_06_2010" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_07_2010" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_08_2010" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_09_2010" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_10_2010" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_11_2010" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_12_2010" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_01_2011" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_02_2011" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_03_2011" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_04_2011" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_05_2011" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_06_2011" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_07_2011" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_08_2011" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_09_2011" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_10_2011" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_11_2011" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_12_2011" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_01_2012" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_02_2012" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_03_2012" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_04_2012" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_05_2012" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_06_2012" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_07_2012" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_08_2012" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_09_2012" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_10_2012" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_11_2012" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_12_2012" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_01_2013" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_02_2013" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_03_2013" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_04_2013" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_05_2013" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_06_2013" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_07_2013" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_08_2013" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_09_2013" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_10_2013" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_11_2013" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_12_2013" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_01_2014" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_02_2014" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_03_2014" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_04_2014" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_05_2014" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_06_2014" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_07_2014" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_08_2014" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_09_2014" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_10_2014" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_11_2014" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_12_2014" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_01_2015" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_02_2015" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_03_2015" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_04_2015" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_05_2015" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_06_2015" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_07_2015" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_08_2015" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_09_2015" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_10_2015" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_11_2015" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_12_2015" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_01_2016" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_02_2016" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_03_2016" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_04_2016" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_05_2016" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_06_2016" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_07_2016" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_08_2016" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_09_2016" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_10_2016" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_11_2016" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_12_2016" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_01_2017" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_02_2017" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_03_2017" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_04_2017" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_05_2017" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_06_2017" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_07_2017" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_08_2017" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_09_2017" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_10_2017" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_11_2017" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_12_2017" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_01_2018" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_02_2018" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_03_2018" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_04_2018" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_05_2018" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_06_2018" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_07_2018" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_08_2018" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_09_2018" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_10_2018" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_11_2018" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_12_2018" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_01_2019" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_02_2019" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_03_2019" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_04_2019" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_05_2019" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_06_2019" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_07_2019" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_08_2019" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_09_2019" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_10_2019" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_11_2019" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_12_2019" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_01_2020" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_02_2020" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_03_2020" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_04_2020" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_05_2020" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_06_2020" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_07_2020" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_08_2020" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_09_2020" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_10_2020" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_11_2020" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_12_2020" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_01_2021" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_02_2021" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_03_2021" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_04_2021" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_05_2021" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_06_2021" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_07_2021" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_08_2021" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_09_2021" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_10_2021" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_11_2021" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_12_2021" VARCHAR(4) NOT NULL DEFAULT 1,
    "d_01_2022" VARCHAR(4) NOT NULL DEFAULT 1
);

-- CreateTable
CREATE TABLE "rechnungen" (
    "id" SERIAL NOT NULL,
    "benutzer_id" INTEGER NOT NULL,
    "empfaenger_zeile_1" VARCHAR,
    "empfaenger_zeile_2" VARCHAR,
    "strasse" VARCHAR(100) NOT NULL,
    "plz" VARCHAR,
    "ort" VARCHAR,
    "uid" UUID NOT NULL,

    CONSTRAINT "rechnungen_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TokenUsage" (
    "id" SERIAL NOT NULL,
    "token_id" INTEGER NOT NULL,
    "date" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "resource_hash" VARCHAR(6) NOT NULL,
    "payload_length" INTEGER NOT NULL,
    "response_length" INTEGER NOT NULL,
    "response_success" BOOLEAN NOT NULL,
    "response_code" INTEGER NOT NULL,

    CONSTRAINT "PK_TOKEN_USAGE" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tokens" (
    "id" SERIAL NOT NULL,
    "token" VARCHAR(36) NOT NULL,
    "user_id" INTEGER NOT NULL,
    "date_created" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "last_used" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "times_used" INTEGER NOT NULL DEFAULT 0,
    "permissions" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "PK_TOKENS" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VerbrauchsausweisGewerbe" (
    "id" INTEGER NOT NULL,
    "uid" UUID NOT NULL,
    "gebaeude_stammdaten_id" INTEGER NOT NULL,
    "rechnungen_id" INTEGER,
    "benutzer_id" INTEGER NOT NULL,

    CONSTRAINT "VerbrauchsausweisGewerbe_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VerbrauchsausweisWohnen" (
    "id" SERIAL NOT NULL,
    "uid" UUID NOT NULL DEFAULT gen_random_uuid(),
    "gebaeude_stammdaten_id" INTEGER NOT NULL,
    "benutzer_id" INTEGER NOT NULL,
    "rechnungen_id" INTEGER,
    "erstellungsdatum" TIMESTAMP(6),
    "ausstellgrund" VARCHAR,
    "registriernummer" VARCHAR,
    "erledigt" BOOLEAN,
    "baujahr_heizung" INTEGER[],
    "zusaetzliche_heizquelle" BOOLEAN,
    "brennstoff_1" VARCHAR(50),
    "einheit_1" VARCHAR(10),
    "brennstoff_2" VARCHAR(50),
    "einheit_2" VARCHAR(10),
    "startdatum" TIMESTAMP(6),
    "enddatum" TIMESTAMP(6),
    "verbrauch_1" INTEGER,
    "verbrauch_2" INTEGER,
    "verbrauch_3" INTEGER,
    "verbrauch_4" INTEGER,
    "verbrauch_5" INTEGER,
    "verbrauch_6" INTEGER,
    "warmwasser_enthalten" BOOLEAN,
    "anteil_warmwasser_1" DOUBLE PRECISION,
    "anteil_warmwasser_2" DOUBLE PRECISION,

    CONSTRAINT "VerbrauchsausweisWohnen_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "zip_codes" (
    "id" SERIAL NOT NULL,
    "zip" VARCHAR(5) NOT NULL,
    "city" VARCHAR(100) NOT NULL,
    "state" VARCHAR(100) NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "benutzer_email_idx" ON "benutzer"("email");

-- CreateIndex
CREATE UNIQUE INDEX "benutzer_uid_key" ON "benutzer"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "gebaeude_bilder_uid_key" ON "gebaeude_bilder"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "gebaeude_stammdaten_uid_key" ON "gebaeude_stammdaten"("uid");

-- AddForeignKey
ALTER TABLE "adressen" ADD CONSTRAINT "adressen_benutzer_id_fkey" FOREIGN KEY ("benutzer_id") REFERENCES "benutzer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "anteilshaber" ADD CONSTRAINT "anteilshaber_benutzer_id_fkey" FOREIGN KEY ("benutzer_id") REFERENCES "benutzer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "anteilshaber" ADD CONSTRAINT "anteilshaber_gebaeude_id_fkey" FOREIGN KEY ("gebaeude_id") REFERENCES "gebaeude_stammdaten"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "bedarfsausweis_wohnen" ADD CONSTRAINT "bedarfsausweis_wohnen_benutzer_id_fkey" FOREIGN KEY ("benutzer_id") REFERENCES "benutzer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "bedarfsausweis_wohnen" ADD CONSTRAINT "bedarfsausweis_wohnen_gebaeude_stammdaten_id_fkey" FOREIGN KEY ("gebaeude_stammdaten_id") REFERENCES "gebaeude_stammdaten"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "bedarfsausweis_wohnen" ADD CONSTRAINT "bedarfsausweis_wohnen_rechnungen_id_fkey" FOREIGN KEY ("rechnungen_id") REFERENCES "rechnungen"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "benutzer" ADD CONSTRAINT "benutzer_rechnung_adresse_id_fkey" FOREIGN KEY ("rechnung_adresse_id") REFERENCES "adressen"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "benutzer" ADD CONSTRAINT "besteller_adressen_id_fkey1" FOREIGN KEY ("benutzer_adresse_id") REFERENCES "adressen"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "benutzer" ADD CONSTRAINT "besteller_adressen_id_fkey2" FOREIGN KEY ("versand_adresse_id") REFERENCES "adressen"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "documenttemplates" ADD CONSTRAINT "benutzer_fk" FOREIGN KEY ("user_id") REFERENCES "benutzer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "documenttemplates" ADD CONSTRAINT "documenttypes_fk" FOREIGN KEY ("documenttype") REFERENCES "documenttypes"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "gebaeude_bilder" ADD CONSTRAINT "gebaeude_bilder_gebaeude_stammdaten_id_fkey" FOREIGN KEY ("gebaeude_stammdaten_id") REFERENCES "gebaeude_stammdaten"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "gebaeude_plaene" ADD CONSTRAINT "gebaeude_plaene_gebaeude_stammdaten_id_fkey" FOREIGN KEY ("gebaeude_stammdaten_id") REFERENCES "gebaeude_stammdaten"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "gebaeude_stammdaten" ADD CONSTRAINT "gebaeude_stammdaten_benutzer_id_fkey" FOREIGN KEY ("benutzer_id") REFERENCES "benutzer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "gebaeude_stammdaten" ADD CONSTRAINT "gebaeude_stammdaten_gebaeude_adresse_id_fkey" FOREIGN KEY ("gebaeude_adresse_id") REFERENCES "adressen"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "rechnungen" ADD CONSTRAINT "rechnungen_benutzer_id_fkey" FOREIGN KEY ("benutzer_id") REFERENCES "benutzer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "TokenUsage" ADD CONSTRAINT "fk_tokens_token_usage_token_id" FOREIGN KEY ("token_id") REFERENCES "tokens"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tokens" ADD CONSTRAINT "fk_benutzer_tokens_user_id" FOREIGN KEY ("user_id") REFERENCES "benutzer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "VerbrauchsausweisGewerbe" ADD CONSTRAINT "VerbrauchsausweisGewerbe_benutzer_id_fkey" FOREIGN KEY ("benutzer_id") REFERENCES "benutzer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "VerbrauchsausweisGewerbe" ADD CONSTRAINT "VerbrauchsausweisGewerbe_gebaeude_stammdaten_id_fkey" FOREIGN KEY ("gebaeude_stammdaten_id") REFERENCES "gebaeude_stammdaten"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "VerbrauchsausweisGewerbe" ADD CONSTRAINT "VerbrauchsausweisGewerbe_rechnungen_id_fkey" FOREIGN KEY ("rechnungen_id") REFERENCES "rechnungen"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "VerbrauchsausweisWohnen" ADD CONSTRAINT "VerbrauchsausweisWohnen_benutzer_id_fkey" FOREIGN KEY ("benutzer_id") REFERENCES "benutzer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "VerbrauchsausweisWohnen" ADD CONSTRAINT "VerbrauchsausweisWohnen_gebaeude_stammdaten_id_fkey" FOREIGN KEY ("gebaeude_stammdaten_id") REFERENCES "gebaeude_stammdaten"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "VerbrauchsausweisWohnen" ADD CONSTRAINT "VerbrauchsausweisWohnen_rechnungen_id_fkey" FOREIGN KEY ("rechnungen_id") REFERENCES "rechnungen"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
