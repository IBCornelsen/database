-- Jeder Nutzer kann mehrere Adressen haben.
INSERT INTO
	adressen (benutzer_id, strasse, plz, ort)
VALUES
	(1, 'Hauptstraße', '12345', 'Berlin'),
	(1, 'Bahnhofstraße', '23456', 'München'),
	(1, 'Goethestraße', '34567', 'Hamburg'),
	(1, 'Schillerstraße', '45678', 'Frankfurt');

-- Primäre Adresse des Benutzers festlegen.
UPDATE
	benutzer
SET
	adressen_id = 1
WHERE
	id = 1;