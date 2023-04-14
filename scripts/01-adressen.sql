BEGIN;

CREATE TABLE IF NOT EXISTS public.adressen (
  id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
  name character varying(255) COLLATE pg_catalog."default" DEFAULT NULL,
  adresse character varying(255) COLLATE pg_catalog."default" DEFAULT NULL,
  zusatzzeile character varying(255) COLLATE pg_catalog."default" DEFAULT NULL,
  plz character varying(5) COLLATE pg_catalog."default" DEFAULT NULL,
  ort character varying(100) COLLATE pg_catalog."default" DEFAULT NULL,
  telefon character varying(20) COLLATE pg_catalog."default" DEFAULT NULL,
  email character varying(255) COLLATE pg_catalog."default" DEFAULT NULL,
  user_id integer NOT NULL,
	CONSTRAINT "PK_ADRESSEN" PRIMARY KEY (id)
) ;

INSERT INTO adressen (name, adresse, zusatzzeile, plz, ort, telefon, email, user_id) VALUES
('Léa', 'Località Pregasina, 82', '', '22049', 'Hamburg Dulsberg', '', 'user@ib-cornelsen.de', 1);

ALTER TABLE adressen
  ADD CONSTRAINT adressen_FK FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE;

END;