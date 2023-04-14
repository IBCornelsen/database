BEGIN;

CREATE TABLE IF NOT EXISTS public.users
(
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
	email character varying(255) COLLATE pg_catalog."default" NOT NULL,
	password character varying(255) COLLATE pg_catalog."default" NOT NULL,
	uid character varying(36) COLLATE pg_catalog."default" NOT NULL,
	CONSTRAINT "PK_USERS" PRIMARY KEY (id)
);

INSERT INTO users (email, password, uid) VALUES
('user@ib-cornelsen.de', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2a330cb8-3975-4112-9a62-80c4cc0d3b2e');

END;