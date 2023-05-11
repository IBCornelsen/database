BEGIN;

CREATE TABLE IF NOT EXISTS public.documenttemplates (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
  name character varying(100) NOT NULL,
	shortdescription character varying(100) NOT NULL,
	longdescription character varying(5000) NOT NULL,
  user_id integer NOT NULL,
  is_private BOOLEAN NOT NULL DEFAULT 't',
  documenttype integer NOT NULL,
  filename character varying(100) NOT NULL,
  created_at timestamp(0) NOT NULL DEFAULT NOW(),
  updated_at timestamp(0) NOT NULL DEFAULT NOW(),
	CONSTRAINT "PK_DOCUMENTTEMPLATES" PRIMARY KEY (id)
) ;

-- INSERT INTO documenttemplates (name, shortdescription, longdescription, user_id, is_private, documenttype, filename, created_at, updated_at) VALUES
-- ('expose', 'Gebäude Exposé', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,', 1, 'f', 1, '123e4567-e89b-12d3-a456-426614174000', '2023-04-13 09:57:11','2023-04-13 09:57:11'),
-- ('energieausweis', 'Energieausweis', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquy', 1, 'f', 2, '123e4567-e89b-12d3-a456-426614174000', '2023-04-13 09:57:11','2023-04-13 09:57:11'),
-- ('gutachten', 'Gutachten', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, s', 1, 't', 3, '123e4567-e89b-12d3-a456-426614174000', '2023-04-13 09:57:11','2023-04-13 09:57:11');

ALTER TABLE documenttemplates
  ADD CONSTRAINT BENUTZER_FK FOREIGN KEY (user_id) REFERENCES benutzer (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE documenttemplates
  ADD CONSTRAINT DOCUMENTTYPES_FK FOREIGN KEY (documenttype) REFERENCES documenttypes (id) ON DELETE CASCADE ON UPDATE CASCADE;  


END;
