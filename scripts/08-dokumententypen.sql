BEGIN;

CREATE TABLE IF NOT EXISTS public.documenttypes (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(100) NOT NULL,
	shortdescription character varying(100) NOT NULL,
	longdescription character varying(5000) NOT NULL,
	CONSTRAINT "PK_DOCUMENTTYPES" PRIMARY KEY (id)
) ;

INSERT INTO documenttypes (name, shortdescription, longdescription) VALUES
('expose', 'Gebäude Exposé', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea '),
('energieausweis', 'Energieausweis', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores '),
('gutachten', 'Gutachten', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet ');

END;
