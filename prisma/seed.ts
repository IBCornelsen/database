// Das wird ausgeführt, wenn wir `npx prisma db seed` ausführen
// Hier können wir unsere Datenbank mit Beispieldaten füllen
// Mehr Infos: https://www.prisma.io/docs/orm/prisma-migrate/workflows/seeding

import { PrismaClient } from '@prisma/client'
import crypto from "node:crypto"
import { faker } from '@faker-js/faker';

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
		id: { not: 0 }
	}
})

await prisma.postleitzahlen.deleteMany({
	where: {
		id: { not: 0 }
	}
})

// Jetzt koennen wir die Daten aus dem Backup einlesen.

const klimafaktoren = await Bun.file('./backup/klimafaktoren.json').json()

await prisma.klimafaktoren.createMany({
	data: klimafaktoren.map((klimafaktor: [number, number, number, string]) => {
		return {
			plz: klimafaktor[3],
			month: klimafaktor[1],
			year: klimafaktor[0],
			klimafaktor: klimafaktor[2]
		}
	})
})

const postleitzahlen = await Bun.file('./backup/postleitzahlen.json').json()

await prisma.postleitzahlen.createMany({
	data: postleitzahlen.map((postleitzahl: { plz: string, ort: string, landkreis: string, bundesland: string, lat: number, lon: number }) => {
		return {
			plz: postleitzahl.plz,
			stadt: postleitzahl.ort,
			landkreis: postleitzahl.landkreis,
			bundesland: postleitzahl.bundesland,
			lat: postleitzahl.lat,
			lon: postleitzahl.lon
		}
	})
})

function hashPassword(password: string): string {
	const salt = crypto.randomBytes(16).toString("hex");
	const hash = hashWithGivenSalt(password, salt) + salt;
	return hash;
}

function hashWithGivenSalt(password: string, salt: string): string {
	const hash = crypto.scryptSync(password, salt, 32).toString("hex");
	return hash;
}

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
	}
})

// Benutzer erstellen

for (let i = 0; i < 100; i++) {
	let firstName = faker.person.firstName()
	let lastName = faker.person.lastName()
	const benutzer = await prisma.benutzer.create({
		data: {
			email: faker.internet.email({
				firstName: firstName,
				lastName: lastName
			}),
			passwort: hashPassword(faker.internet.password()),
			name: lastName,
			vorname: firstName,
			adresse: faker.location.street(),
			plz: faker.location.zipCode({ format: "#####" }),
			ort: faker.location.city(),
			rolle: "USER"
		}
	})

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
						id: benutzer.id
					}
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
						Benutzer: {
							connect: {
								id: benutzer.id
							}
						},
						VerbrauchsausweisWohnen: {
							create: {
								benutzer: {
									connect: {
										id: benutzer.id
									}
								}
							}
						}
					}
				}
			}
		})
	}
}