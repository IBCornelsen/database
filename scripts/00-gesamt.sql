BEGIN;

CREATE TABLE adressen(
  id serial NOT NULL,
  benutzer_id integer NOT NULL,
  strasse varchar(100) NOT NULL,
  plz varchar(5) NOT NULL,
  ort varchar(50) NOT NULL,
  uid uuid DEFAULT gen_random_uuid(),
  CONSTRAINT adressen_pkey PRIMARY KEY(id)
);

CREATE TABLE angebote(
id serial NOT NULL, gebaeude_id integer NOT NULL,
  CONSTRAINT angebote_pkey PRIMARY KEY(id)
);

CREATE TABLE anteilshaber(
  benutzer_id integer NOT NULL,
  gebaeude_id integer NOT NULL,
  rolle varchar,
  privilegien bigint,
  uid uuid
);

COMMENT ON COLUMN anteilshaber.privilegien IS
  'Benutzerdefinierte Berechtigungen für spezifizierte Anteilshaber.';

CREATE TABLE benutzer(
  id serial NOT NULL,
  "name" varchar(50),
  vorname varchar(50),
  uid uuid DEFAULT gen_random_uuid(),
  email varchar(255) NOT NULL,
  passwort varchar(255) NOT NULL,
  adressen_id integer,
  CONSTRAINT benutzer_pkey PRIMARY KEY(id)
);

  CREATE UNIQUE INDEX benutzer_email_idx ON benutzer(email);
  
COMMENT ON COLUMN benutzer.adressen_id IS 'Primäre Adresse des Benutzers';

CREATE TABLE energieausweise(
  id serial NOT NULL,
  uid uuid NOT NULL DEFAULT gen_random_uuid(),
  gebaeude_id integer NOT NULL,
  gebaeude_geometrie_id integer,
  energiekennwerte_id integer,
  ausweisart varchar NOT NULL DEFAULT 'VA',
  erstellungsdatum timestamp,
  ausstellgrund varchar,
  registriernummer varchar,
  erledigt bool,
  baujahr_anlage integer[],
  CONSTRAINT energieausweise_pkey PRIMARY KEY(id)
);

CREATE TABLE energiekennwerte(
  id serial NOT NULL,
  uid uuid NOT NULL DEFAULT gen_random_uuid(),
  gebaeude_id integer NOT NULL,
  zeitraum date,
  verbrauch_1 integer,
  verbrauch_2 integer,
  verbrauch_3 integer,
  verbrauch_4 integer,
  verbrauch_5 integer,
  verbrauch_6 integer,
  einheit_1 varchar,
  einheit_2 varchar,
  energietraeger_1 varchar,
  energietraeger_2 varchar,
  anteil_warmwasser_1 varchar,
  anteil_warmwasser_2 varchar,
  CONSTRAINT energiekennwerte_pkey PRIMARY KEY(id)
);

CREATE TABLE gebaeude(
  id serial NOT NULL,
  uid uuid NOT NULL DEFAULT gen_random_uuid(),
  benutzer_id integer,
  versand_adressen_id integer,
  typ varchar,
  plz varchar,
  ort varchar,
  strasse varchar,
  gebaeudeteil varchar,
  saniert bool,
  baujahr integer[],
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
  vanw_stromverbrauch_sonstige varchar,
  vanw_strom_1 float8,
  vanw_strom_2 float8,
  vanw_strom_3 float8,
  wird_gekuehlt bool,
  CONSTRAINT gebaeude_pkey PRIMARY KEY(id)
);

CREATE TABLE gebaeude_bilder(
  id serial NOT NULL,
  uid uuid NOT NULL DEFAULT gen_random_uuid(),
  gebaeude_id integer NOT NULL,
  kategorie varchar NOT NULL,
  CONSTRAINT gebaeude_bilder_pkey PRIMARY KEY(id)
);

CREATE TABLE gebaeude_geometrie(
id serial NOT NULL, gebaeude_id integer NOT NULL,
  CONSTRAINT gebaeude_geometrie_pkey PRIMARY KEY(id)
);

CREATE TABLE gebaeude_plaene(
id serial NOT NULL, gebaeude_id integer NOT NULL,
  CONSTRAINT gebaeude_plaene_pkey PRIMARY KEY(id)
);

CREATE TABLE "Postleitzahlen"
  (id integer NOT NULL, CONSTRAINT "Postleitzahlen_pkey" PRIMARY KEY(id));

CREATE TABLE rechnungen(
  id serial NOT NULL,
  gebaeude_id integer NOT NULL,
  strasse varchar(100) NOT NULL,
  benutzer_id integer NOT NULL,
  CONSTRAINT rechnungen_pkey PRIMARY KEY(id)
);

ALTER TABLE energieausweise
  ADD CONSTRAINT energieausweise_gebaeude_id_fkey
    FOREIGN KEY (gebaeude_id) REFERENCES gebaeude (id);

ALTER TABLE gebaeude_plaene
  ADD CONSTRAINT gebaeude_plaene_gebaeude_id_fkey
    FOREIGN KEY (gebaeude_id) REFERENCES gebaeude (id);

ALTER TABLE angebote
  ADD CONSTRAINT angebote_gebaeude_id_fkey
    FOREIGN KEY (gebaeude_id) REFERENCES gebaeude (id);

ALTER TABLE gebaeude_geometrie
  ADD CONSTRAINT gebaeude_geometrie_gebaeude_id_fkey
    FOREIGN KEY (gebaeude_id) REFERENCES gebaeude (id);

ALTER TABLE energiekennwerte
  ADD CONSTRAINT energiekennwerte_gebaeude_id_fkey
    FOREIGN KEY (gebaeude_id) REFERENCES gebaeude (id);

ALTER TABLE energieausweise
  ADD CONSTRAINT energieausweise_gebaeude_geometrie_id_fkey
    FOREIGN KEY (gebaeude_geometrie_id) REFERENCES gebaeude_geometrie (id);

ALTER TABLE energieausweise
  ADD CONSTRAINT energieausweise_energiekennwerte_id_fkey
    FOREIGN KEY (energiekennwerte_id) REFERENCES energiekennwerte (id);

ALTER TABLE gebaeude_bilder
  ADD CONSTRAINT gebaeude_bilder_gebaeude_id_fkey
    FOREIGN KEY (gebaeude_id) REFERENCES gebaeude (id);

ALTER TABLE gebaeude
  ADD CONSTRAINT gebaeude_benutzer_id_fkey
    FOREIGN KEY (benutzer_id) REFERENCES benutzer (id);

ALTER TABLE rechnungen
  ADD CONSTRAINT rechnungen_gebaeude_id_fkey
    FOREIGN KEY (gebaeude_id) REFERENCES gebaeude (id);

ALTER TABLE adressen
  ADD CONSTRAINT adressen_benutzer_id_fkey
    FOREIGN KEY (benutzer_id) REFERENCES benutzer (id);

ALTER TABLE gebaeude
  ADD CONSTRAINT gebaeude_versand_adressen_id_fkey
    FOREIGN KEY (versand_adressen_id) REFERENCES adressen (id);

ALTER TABLE rechnungen
  ADD CONSTRAINT rechnungen_benutzer_id_fkey
    FOREIGN KEY (benutzer_id) REFERENCES benutzer (id);

ALTER TABLE anteilshaber
  ADD CONSTRAINT anteilshaber_benutzer_id_fkey
    FOREIGN KEY (benutzer_id) REFERENCES benutzer (id);

ALTER TABLE anteilshaber
  ADD CONSTRAINT anteilshaber_gebaeude_id_fkey
    FOREIGN KEY (gebaeude_id) REFERENCES gebaeude (id);

ALTER TABLE benutzer
  ADD CONSTRAINT benutzer_adressen_id_fkey
    FOREIGN KEY (adressen_id) REFERENCES adressen (id);

END;