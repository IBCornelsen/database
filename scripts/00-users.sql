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
('user@ib-cornelsen.de', '4de9def1a42a1086859e4de1647a5915262d19f129ddd05252d0dcf37da51a0cef0fdc5331e64eb0e060ee92159f88c1', '2a330cb8-3975-4112-9a62-80c4cc0d3b2e');

END;