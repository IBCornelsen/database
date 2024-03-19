// Das wird ausgeführt, wenn wir `npx prisma db seed` ausführen
// Hier können wir unsere Datenbank mit Beispieldaten füllen
// Mehr Infos: https://www.prisma.io/docs/orm/prisma-migrate/workflows/seeding

import { PrismaClient } from "@prisma/client";
import crypto from "node:crypto";
import { faker } from "@faker-js/faker";
import { Enums } from "../src/types";
import moment from "moment";

function hashPassword(password: string): string {
	const salt = crypto.randomBytes(16).toString("hex");
	const hash = hashWithGivenSalt(password, salt) + salt;
	return hash;
}

function hashWithGivenSalt(password: string, salt: string): string {
	const hash = crypto.scryptSync(password, salt, 32).toString("hex");
	return hash;
}

const prisma = new PrismaClient({
	log: ["warn", "error"],
	errorFormat: "pretty",
	datasources: {
		db: {
			url: process.env.POSTGRES_DATABASE_URL,
		},
	},
});

// Wir wollen erstmal das Backup mit den Klimafaktoren und der PLZ Liste einfuegen.
// Dazu muessen wir die Tabelle leeren.

await prisma.klimafaktoren.deleteMany({
	where: {
		id: { not: 0 },
	},
});

await prisma.postleitzahlen.deleteMany({
	where: {
		id: { not: 0 },
	},
});

// Jetzt koennen wir die Daten aus dem Backup einlesen.

const klimafaktoren = await Bun.file("./backup/klimafaktoren.json").json();

await prisma.klimafaktoren.createMany({
	data: klimafaktoren.map((klimafaktor: [number, number, number, string]) => {
		return {
			plz: klimafaktor[3],
			month: klimafaktor[1],
			year: klimafaktor[0],
			klimafaktor: klimafaktor[2],
		};
	}),
});

const postleitzahlen = await Bun.file("./backup/postleitzahlen.json").json();

await prisma.postleitzahlen.createMany({
	data: postleitzahlen.map(
		(postleitzahl: {
			plz: string;
			ort: string;
			landkreis: string;
			bundesland: string;
			lat: number;
			lon: number;
		}) => {
			return {
				plz: postleitzahl.plz,
				stadt: postleitzahl.ort,
				landkreis: postleitzahl.landkreis,
				bundesland: postleitzahl.bundesland,
				lat: postleitzahl.lat,
				lon: postleitzahl.lon,
			};
		}
	),
});

// Admin erstellen
await prisma.benutzer.create({
	data: {
		email: "admin@ib-cornelsen.de",
		passwort: hashPassword("0G4v2ij1OXTscIx"),
		rolle: "ADMIN",
		name: "Admin",
		vorname: "Admin",
		adresse: "Adminstraße 1",
		plz: "12345",
	},
});

// Benutzer erstellen

for (let i = 0; i < 10; i++) {
	let firstName = faker.person.firstName();
	let lastName = faker.person.lastName();
	const benutzer = await prisma.benutzer.create({
		data: {
			email: faker.internet.email({
				firstName: firstName,
				lastName: lastName,
			}),
			passwort: hashPassword(faker.internet.password()),
			name: lastName,
			vorname: firstName,
			adresse: faker.location.street(),
			plz: faker.location.zipCode({ format: "#####" }),
			ort: faker.location.city(),
			rolle: "USER",
		},
	});

	for (let j = 0; j < Math.round(Math.random() * 5); j++) {
		// Für jeden Nutzer erstellen wir auch noch bis zu 5 Ausweise.
		await prisma.gebaeudeStammdaten.create({
			data: {
				adresse: faker.location.street(),
				latitude: faker.location.latitude(),
				longitude: faker.location.longitude(),
				ort: faker.location.city(),
				plz: faker.location.zipCode({ format: "#####" }),
				benutzer: {
					connect: {
						id: benutzer.id,
					},
				},
				gebaeude_aufnahme_allgemein: {
					create: {
						adresse: faker.location.street(),
						alternative_heizung: faker.datatype.boolean(),
						alternative_kuehlung: faker.datatype.boolean(),
						alternative_lueftung: faker.datatype.boolean(),
						alternative_warmwasser: faker.datatype.boolean(),
						aussenwand_gedaemmt: faker.datatype.boolean(),
						aussenwand_min_12cm_gedaemmt: faker.datatype.boolean(),
						baujahr_gebaeude: [faker.date.past().getFullYear()],
						baujahr_heizung: [faker.date.past().getFullYear()],
						baujahr_klima: [faker.date.past().getFullYear()],
						benutzer: {
							connect: {
								id: benutzer.id,
							},
						},
						verbrauchsausweis_wohnen: {
							create: {
								benutzer: {
									connect: {
										id: benutzer.id,
									},
								},
							},
						},
					},
				},
			},
		});
	}
}

export async function importVerbrauchsausweisWohnenAltesSystem(
	count: number = 5
) {
	const response = await fetch(
		"https://online-energieausweis.org/user/ausweis-import.php",
		{
			method: "POST",
			body: JSON.stringify({
				i: count,
				offset: 0,
				q: {},
			}),
		}
	);

	const data = await response.json();

	return data;
}

export async function verbrauchsausweisWohnenImportTranslate(
	ausweis: Record<string, any>
) {
	let firstName = faker.person.firstName();
	let lastName = faker.person.lastName();
	const benutzer = await prisma.benutzer.create({
		data: {
			email: faker.internet.email({
				firstName: firstName,
				lastName: lastName,
			}),
			passwort: hashPassword(faker.internet.password()),
			name: lastName,
			vorname: firstName,
			adresse: faker.location.street(),
			plz: faker.location.zipCode({ format: "#####" }),
			ort: faker.location.city(),
			rolle: "USER",
		},
	});

	// TODO: Bilder Importieren
	const gebaeudeStammdaten = await prisma.gebaeudeStammdaten.create({
		data: {
			adresse: ausweis.objekt_strasse,
			plz: ausweis.objekt_plz,
			ort: ausweis.objekt_ort,
			uid: faker.string.uuid(),
			latitude: null,
			longitude: null,
			benutzer: {
				connect: {
					id: benutzer.id,
				},
			},
		},
	});

	const gebaeudeAufnahmeAllgemein =
		await prisma.gebaeudeAufnahmeAllgemein.create({
			data: {
				benutzer: {
					connect: {
						id: benutzer.id,
					},
				},
				baujahr_gebaeude: [parseInt(ausweis.baujahr_gebaeude)],
				baujahr_heizung: ausweis.baujahr_anlage ? [parseInt(ausweis.baujahr_anlage)] : [],
				baujahr_klima: ausweis.baujahr_klimaanlage ? [parseInt(ausweis.baujahr_klimaanlage)] : [],
				adresse: ausweis.objekt_strasse,
				plz: ausweis.objekt_plz,
				ort: ausweis.objekt_ort,
				nutzflaeche: parseInt(ausweis.nutzflaeche),
				einheiten: parseInt(ausweis.anzahl_einheiten),
				saniert: ausweis.objekt_saniert ? true : false,
				keller:
					ausweis.keller_beheizt == "Beheizt"
						? Enums.Heizungsstatus.BEHEIZT
						: ausweis.keller_beheizt == "Unbeheizt"
						? Enums.Heizungsstatus.UNBEHEIZT
						: Enums.Heizungsstatus.NICHT_VORHANDEN,
				dachgeschoss:
					ausweis.dachgeschoss == "Beheizt"
						? Enums.Heizungsstatus.BEHEIZT
						: ausweis.dachgeschoss == "Unbeheizt"
						? Enums.Heizungsstatus.UNBEHEIZT
						: Enums.Heizungsstatus.NICHT_VORHANDEN,
				flaeche: parseInt(ausweis.wohnflaeche),
				gebaeudetyp: ausweis.objekt_typ,
				gebaeudeteil: ausweis.objekt_gebaeudeteil,
				lueftung: ausweis.lueftungskonzept,
				// NOTE: Warum ist das kein Bool?
				kuehlung: ausweis.wird_gekuehlt ? "true" : "false",
				brennstoff_1: ausweis.energietraeger_1,
				brennstoff_2: ausweis.energietraeger_2,
				alternative_heizung: ausweis.alheizung ? true : false,
				alternative_kuehlung: ausweis.alkuehlung ? true : false,
				alternative_lueftung: ausweis.allueftung ? true : false,
				alternative_warmwasser: ausweis.alwarmwasser ? true : false,
				ausweisart: Enums.Ausweisart.VerbrauchsausweisWohnen,
				energieeffizienzklasse: "",
				aussenwand_gedaemmt: ausweis.aussenwand_gedaemmt ? true : false,
				aussenwand_min_12cm_gedaemmt: ausweis.aussenwand_min_12cm_gedaemmt ? true : false,
				bestellt: ausweis.bestellt ? true : false,
				boxpruefung: ausweis.boxpruefung ? true : false,
				brennwert_kessel: ausweis.brennwert_kessel ? true : false,
				dachgeschoss_gedaemmt: ausweis.dachgeschoss_gedaemmt ? true : false,
				dachgeschoss_min_12cm_gedaemmt: ausweis.dachgeschoss_min_12cm_gedaemmt ? true : false,
				doppel_verglasung: ausweis.doppel_verglasung ? true : false,
				dreifach_verglasung: ausweis.dreifach_verglasung ? true : false,
				durchlauf_erhitzer: ausweis.durchlauf_erhitzer ? true : false,
				einfach_verglasung: ausweis.einfach_verglasung ? true : false,
				einzelofen: ausweis.einzelofen ? true : false,
				erledigt: ausweis.erledigt ? true : false,
				fenster_dicht: ausweis.fenster_dicht ? true : false,
				fenster_teilweise_undicht: ausweis.fenster_teilweise_undicht ? true : false,
				heizungsrohre_gedaemmt: ausweis.heizungsrohre_gedaemmt ? true : false,
				isolier_verglasung: ausweis.isolier_verglasung ? true : false,
				keller_decke_gedaemmt: ausweis.keller_decke_gedaemmt ? true : false,
				keller_wand_gedaemmt: ausweis.keller_wand_gedaemmt ? true : false,
				niedertemperatur_kessel: ausweis.niedertemperatur_kessel ? true : false,
				oberste_geschossdecke_gedaemmt: ausweis.oberste_geschossdecke_gedaemmt ? true : false,
				oberste_geschossdecke_min_12cm_gedaemmt: ausweis.oberste_geschossdecke_min_12cm_gedaemmt ? true : false,
				raum_temperatur_regler: ausweis.raum_temperatur_regler ? true : false,
				rolllaeden_kaesten_gedaemmt: ausweis.rolllaeden_kaesten_gedaemmt ? true : false,
				solarsystem_warmwasser: ausweis.solarsystem_warmwasser ? true : false,
				standard_kessel: ausweis.standard_kessel ? true : false,
				waermepumpe: ausweis.waermepumpe ? true : false,
				warmwasser_rohre_gedaemmt: ausweis.warmwasser_rohre_gedaemmt ? true : false,
				zentralheizung: ausweis.zentralheizung ? true : false,
				zirkulation: ausweis.zirkulation ? true : false,
				photovoltaik: ausweis.photovoltaik ? true : false,
				leerstand: ausweis.leerstand,
				prueftext: ausweis["check-texts"],

				storniert: false,
				tueren_dicht: ausweis.tueren_dicht ? true : false,
				tueren_undicht: ausweis.tueren_undicht ? true : false,
				zurueckgestellt: ausweis.zurueckGestellt ? true : false,
				uid: faker.string.uuid(),
				ausstellungsdatum: moment(ausweis.bestelldatum).toDate(),
				erstellungsdatum: moment(ausweis.erstellungsdatum).toDate(),
				gebaeude_stammdaten: {
					connect: {
						id: gebaeudeStammdaten.id,
					},
				},
			},
		});

	let startdatum = moment(
		`${ausweis.energieverbrauch_zeitraum_jahr}-${ausweis.energieverbrauch_zeitraum_monat}-01`
	).toDate();

	if (isNaN(startdatum.getTime())) {
		startdatum = new Date();
	}

	const verbrauchsausweisWohnen = await prisma.verbrauchsausweisWohnen.create(
		{
			data: {
				gebaeude_aufnahme_allgemein: {
					connect: {
						id: gebaeudeAufnahmeAllgemein.id,
					},
				},
				benutzer: {
					connect: {
						id: benutzer.id,
					},
				},
				verbrauch_1: parseInt(ausweis.energieverbrauch_1_heizquelle_1),
				verbrauch_2: parseInt(ausweis.energieverbrauch_2_heizquelle_1),
				verbrauch_3: parseInt(ausweis.energieverbrauch_3_heizquelle_1),
				verbrauch_4: parseInt(ausweis.energieverbrauch_1_heizquelle_2),
				verbrauch_5: parseInt(ausweis.energieverbrauch_2_heizquelle_2),
				verbrauch_6: parseInt(ausweis.energieverbrauch_3_heizquelle_2),
				einheit_1: ausweis.energietraeger_einheit_heizquelle_1,
				einheit_2: ausweis.energietraeger_einheit_heizquelle_2,
				warmwasser_enthalten: ausweis.warmwasser_enthalten ? true : false,
				uid: faker.string.uuid(),
				alternative_heizung: ausweis.alheizung ? true : false,
				alternative_kuehlung: ausweis.alkuehlung ? true : false,
				alternative_lueftung: ausweis.allueftung ? true : false,
				alternative_warmwasser: ausweis.alwarmwasser ? true : false,
				anteil_warmwasser_1: ausweis.anteil_warmwasser_1,
				anteil_warmwasser_2: ausweis.anteil_warmwasser_2,
				ausstellgrund: ausweis.ausstellgrund,
				keller_beheizt: ausweis.keller_beheizt ? true : false,
				registriernummer: ausweis.regnummer,
				// Der Monat im alten System ist 1-basiert, in der neuen Datenbank 0-basiert
				// Also müssen wir hier 1 abziehen
				startdatum,
				warmwasser_anteil_bekannt: ausweis.warmwasser_anteil_bekannt ? true : false,
				wird_gekuehlt: ausweis.wird_gekuehlt ? true : false,
				zusaetzliche_heizquelle: ausweis.zusaetzliche_heizquelle ? true : false,
			},
		}
	);

	return verbrauchsausweisWohnen;
}

const ausweise = (await importVerbrauchsausweisWohnenAltesSystem(10)) as { data: any[], result_count: number };

for (const ausweis of ausweise.data) {
	await verbrauchsausweisWohnenImportTranslate(ausweis);
}
