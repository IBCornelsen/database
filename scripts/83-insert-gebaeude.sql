INSERT INTO
	gebaeude (
		benutzer_id,
		versand_adressen_id,
		typ,
		plz,
		ort,
		strasse,
		gebaeudeteil,
		saniert,
		baujahr,
		einheiten,
		wohnflaeche,
		keller_beheizt,
		dachgeschoss_beheizt,
		lueftungskonzept,
		leerstand,
		versorgungssysteme,
		fenster_dach,
		energiequelle_2_nutzung,
		daemmung
	)
VALUES
	(
		1,
		2,
		'Einfamilienhaus',
		'21039',
		'Hamburg',
		'Mönckebergstraße 12',
		'Gesamtgebäude',
		TRUE,
		ARRAY [1952, 1976],
		2,
		152,
		TRUE,
		1,
		'Fensterlüftung',
		0,
		6,
		6,
		6,
		6
	);