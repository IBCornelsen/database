INSERT INTO
	energieausweise (
		gebaeude_id,
		energiekennwerte_id,
		ausweisart,
		erstellungsdatum,
		ausstellgrund,
		registriernummer,
		erledigt,
		baujahr_anlage
	)
VALUES
	(
		1,
		1,
		'VA',
		'2023-05-15 15:35:01',
		'Verkauf',
		'',
		FALSE,
		ARRAY [1976, 2004]
	);