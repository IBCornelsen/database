BEGIN;

CREATE TABLE adressen(
	id serial NOT NULL,
	benutzer_id integer NOT NULL,
	empfaenger_zeile_1 varchar NOT NULL,
	empfaenger_zeile_2 varchar,
	strasse varchar(100) NOT NULL,
	plz varchar(5) NOT NULL,
	ort varchar(50) NOT NULL,
	geolocation varchar,
	uid uuid DEFAULT gen_random_uuid(),
	CONSTRAINT adressen_pkey PRIMARY KEY(id)
);

CREATE TABLE anteilshaber(
	benutzer_id integer NOT NULL,
	gebaeude_id integer NOT NULL,
	rolle varchar,
	privilegien bigint,
	uid uuid
);

COMMENT ON COLUMN anteilshaber.privilegien IS 'Benutzerdefinierte Berechtigungen für spezifizierte Anteilshaber.';

CREATE TABLE bedarfsausweis_wohnen(
	id serial NOT NULL,
	uid uuid NOT NULL DEFAULT gen_random_uuid(),
	gebaeude_stammdaten_id integer NOT NULL,
	benutzer_id integer NOT NULL,
	rechnungen_id integer NOT NULL,
	ausweisart varchar NOT NULL,
	erstellungsdatum timestamp,
	ausstellgrund varchar NOT NULL,
	registriernummer varchar,
	erledigt bool,
	saniert bool,
	baujahr integer [],
	einheiten integer,
	wohnflaeche integer,
	keller_beheizt bool,
	dachgeschoss_beheizt integer,
	lueftungskonzept varchar,
	leerstand float4,
	versorgungssysteme integer,
	fenster_dach integer,
	energiequelle_2_nutzung integer,
	daemmung integer,
	anzahl_vollgeschosse integer,
	geschosshoehe float8,
	anzahl_gauben integer,
	breite_gauben float8,
	masse_a float8,
	masse_b float8,
	masse_c float8,
	masse_d float8,
	masse_e float8,
	masse_f float8,
	fensterflaeche_so_sw float8,
	fensterflaeche_nw_no float8,
	aussenwandflaeche_unbeheizt float8,
	dachflaeche float8,
	deckenflaeche float8,
	dach_u_wert float8,
	decke_u_wert float8,
	aussenwand_flaeche float8,
	aussenwand_u_wert float8,
	fussboden_flaeche float8,
	fussboden_u_wert float8,
	volumen float8,
	dicht bool,
	fenster_flaeche_1 float8,
	fenster_art_1 float8,
	fenster_flaeche_2 float8,
	fenster_art_2 float8,
	dachfenster_flaeche float8,
	dachfenster_art float8,
	haustuer_flaeche float8,
	haustuer_art float8,
	dach_bauart varchar,
	decke_bauart varchar,
	dach_daemmung float8,
	decke_daemmung float8,
	aussenwand_daemmung float8,
	boden_daemmung float8,
	aussenwand_bauart varchar,
	boden_bauart varchar,
	warmwasser_verteilung varchar,
	warmwasser_speicherung varchar,
	warmwasser_erzeugung varchar,
	heizung_zentral bool,
	heizung_verteilung varchar,
	heizung_speicherung varchar,
	waerme_erzeugung_heizung varchar,
	anteil_zusatzheizung float8,
	kollektor_flaeche float8,
	vanw_stromverbrauch_enthalten float8,
	wird_gekuehlt bool,
	CONSTRAINT bedarfsausweis_wohnen_pkey PRIMARY KEY(id)
);

CREATE TABLE benutzer(
	id serial NOT NULL,
	"name" varchar(50),
	vorname varchar(50),
	email varchar(255) NOT NULL,
	passwort varchar(255) NOT NULL,
	profilbild varchar,
	benutzer_adresse_id integer NOT NULL,
	rechnung_adresse_id integer NOT NULL,
	versand_adresse_id integer NOT NULL,
	uid uuid DEFAULT gen_random_uuid(),
	CONSTRAINT benutzer_pkey PRIMARY KEY(id)
);

CREATE UNIQUE INDEX benutzer_email_idx ON benutzer(email);

COMMENT ON COLUMN benutzer.rechnung_adresse_id IS 'Primäre Adresse des Benutzers';

CREATE TABLE gebaeude_bilder(
	id serial NOT NULL,
	gebaeude_stammdaten_id integer NOT NULL,
	kategorie varchar NOT NULL,
	uid uuid NOT NULL DEFAULT gen_random_uuid(),
	CONSTRAINT gebaeude_bilder_pkey PRIMARY KEY(id)
);

CREATE TABLE gebaeude_plaene(
	id serial NOT NULL,
	gebaeude_stammdaten_id integer NOT NULL,
	uid uuid NOT NULL,
	CONSTRAINT gebaeude_plaene_pkey PRIMARY KEY(id)
);

CREATE TABLE gebaeude_stammdaten(
	id serial NOT NULL,
	benutzer_id integer,
	gebaeude_adresse_id integer NOT NULL,
	gebaeudetyp varchar,
	gebaeudeteil varchar,
	baujahr_gebaeude integer [],
	baujahr_heizung varchar,
	baujahr_klima varchar,
	einheiten integer,
	flaeche integer,
	uid uuid NOT NULL DEFAULT gen_random_uuid(),
	saniert bool,
	keller integer,
	dachgeschoss integer,
	lueftung varchar(50),
	kuehlung varchar(50),
	leerstand integer,
	CONSTRAINT gebaeude_stammdaten_pkey PRIMARY KEY(id)
);

COMMENT ON COLUMN gebaeude_stammdaten.keller IS '0 - Nicht Vorhanden
1 - Beheizt
2 - Unbeheizt';

COMMENT ON COLUMN gebaeude_stammdaten.dachgeschoss IS '0 - Nicht Vorhanden
1 - Beheizt
2 - Unbeheizt';

CREATE TABLE "Postleitzahlen" (
	id integer NOT NULL,
	CONSTRAINT "Postleitzahlen_pkey" PRIMARY KEY(id)
);

CREATE TABLE rechnungen(
	id serial NOT NULL,
	benutzer_id integer NOT NULL,
	empfaenger_zeile_1 varchar,
	empfaenger_zeile_2 varchar,
	strasse varchar(100) NOT NULL,
	plz varchar,
	ort varchar,
	uid uuid NOT NULL,
	CONSTRAINT rechnungen_pkey PRIMARY KEY(id)
);

CREATE TABLE verbrauchsausweis_gewerbe(
	id integer NOT NULL,
	uid uuid NOT NULL,
	gebaeude_stammdaten_id integer NOT NULL,
	rechnungen_id integer NOT NULL,
	benutzer_id integer NOT NULL,
	CONSTRAINT verbrauchsausweis_gewerbe_pkey PRIMARY KEY(id)
);

CREATE TABLE verbrauchsausweis_wohnen(
	id serial NOT NULL,
	uid uuid NOT NULL DEFAULT gen_random_uuid(),
	gebaeude_stammdaten_id integer NOT NULL,
	benutzer_id integer NOT NULL,
	rechnungen_id integer NOT NULL,
	erstellungsdatum timestamp,
	ausstellgrund varchar,
	registriernummer varchar,
	erledigt bool,
	baujahr_heizung integer [],
	zusaetzliche_heizquelle bool,
	brennstoff_1 varchar(50),
	einheit_1 varchar(10),
	brennstoff_2 varchar(50),
	einheit_2 varchar(10),
	startdatum timestamp,
	enddatum timestamp,
	verbrauch_1 integer,
	verbrauch_2 integer,
	verbrauch_3 integer,
	verbrauch_4 integer,
	verbrauch_5 integer,
	verbrauch_6 integer,
	warmwasser_enthalten bool,
	anteil_warmwasser_1 float8,
	anteil_warmwasser_2 float8,
	CONSTRAINT verbrauchsausweis_wohnen_pkey PRIMARY KEY(id)
);

ALTER TABLE
	verbrauchsausweis_wohnen
ADD
	CONSTRAINT verbrauchsausweis_wohnen_gebaeude_stammdaten_id_fkey FOREIGN KEY (gebaeude_stammdaten_id) REFERENCES gebaeude_stammdaten (id);

ALTER TABLE
	gebaeude_plaene
ADD
	CONSTRAINT gebaeude_plaene_gebaeude_stammdaten_id_fkey FOREIGN KEY (gebaeude_stammdaten_id) REFERENCES gebaeude_stammdaten (id);

ALTER TABLE
	gebaeude_bilder
ADD
	CONSTRAINT gebaeude_bilder_gebaeude_stammdaten_id_fkey FOREIGN KEY (gebaeude_stammdaten_id) REFERENCES gebaeude_stammdaten (id);

ALTER TABLE
	gebaeude_stammdaten
ADD
	CONSTRAINT gebaeude_stammdaten_benutzer_id_fkey FOREIGN KEY (benutzer_id) REFERENCES benutzer (id);

ALTER TABLE
	adressen
ADD
	CONSTRAINT adressen_benutzer_id_fkey FOREIGN KEY (benutzer_id) REFERENCES benutzer (id);

ALTER TABLE
	rechnungen
ADD
	CONSTRAINT rechnungen_benutzer_id_fkey FOREIGN KEY (benutzer_id) REFERENCES benutzer (id);

ALTER TABLE
	anteilshaber
ADD
	CONSTRAINT anteilshaber_benutzer_id_fkey FOREIGN KEY (benutzer_id) REFERENCES benutzer (id);

ALTER TABLE
	anteilshaber
ADD
	CONSTRAINT anteilshaber_gebaeude_id_fkey FOREIGN KEY (gebaeude_id) REFERENCES gebaeude_stammdaten (id);

ALTER TABLE
	benutzer
ADD
	CONSTRAINT benutzer_rechnung_adresse_id_fkey FOREIGN KEY (rechnung_adresse_id) REFERENCES adressen (id);

ALTER TABLE
	benutzer
ADD
	CONSTRAINT besteller_adressen_id_fkey1 FOREIGN KEY (benutzer_adresse_id) REFERENCES adressen (id);

ALTER TABLE
	benutzer
ADD
	CONSTRAINT besteller_adressen_id_fkey2 FOREIGN KEY (versand_adresse_id) REFERENCES adressen (id);

ALTER TABLE
	gebaeude_stammdaten
ADD
	CONSTRAINT gebaeude_stammdaten_gebaeude_adresse_id_fkey FOREIGN KEY (gebaeude_adresse_id) REFERENCES adressen (id);

ALTER TABLE
	bedarfsausweis_wohnen
ADD
	CONSTRAINT bedarfsausweis_wohnen_gebaeude_stammdaten_id_fkey FOREIGN KEY (gebaeude_stammdaten_id) REFERENCES gebaeude_stammdaten (id);

ALTER TABLE
	verbrauchsausweis_wohnen
ADD
	CONSTRAINT verbrauchsausweis_wohnen_benutzer_id_fkey FOREIGN KEY (benutzer_id) REFERENCES benutzer (id);

ALTER TABLE
	bedarfsausweis_wohnen
ADD
	CONSTRAINT bedarfsausweis_wohnen_benutzer_id_fkey FOREIGN KEY (benutzer_id) REFERENCES benutzer (id);

ALTER TABLE
	bedarfsausweis_wohnen
ADD
	CONSTRAINT bedarfsausweis_wohnen_rechnungen_id_fkey FOREIGN KEY (rechnungen_id) REFERENCES rechnungen (id);

ALTER TABLE
	verbrauchsausweis_wohnen
ADD
	CONSTRAINT verbrauchsausweis_wohnen_rechnungen_id_fkey FOREIGN KEY (rechnungen_id) REFERENCES rechnungen (id);

ALTER TABLE
	verbrauchsausweis_gewerbe
ADD
	CONSTRAINT verbrauchsausweis_gewerbe_gebaeude_stammdaten_id_fkey FOREIGN KEY (gebaeude_stammdaten_id) REFERENCES gebaeude_stammdaten (id);

ALTER TABLE
	verbrauchsausweis_gewerbe
ADD
	CONSTRAINT verbrauchsausweis_gewerbe_rechnungen_id_fkey FOREIGN KEY (rechnungen_id) REFERENCES rechnungen (id);

ALTER TABLE
	verbrauchsausweis_gewerbe
ADD
	CONSTRAINT verbrauchsausweis_gewerbe_benutzer_id_fkey FOREIGN KEY (benutzer_id) REFERENCES benutzer (id);

END;