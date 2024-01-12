import { BenutzerRolle, Ausstellgrund, Ausweisart, Service, Bezahlmethoden, Rechnungsstatus } from '/home/letsmoe/Documents/IBCornelsen/IBCornelsen/database/node_modules/@prisma/client';
import { faker } from '@faker-js/faker';



export function fakeAnteilshaber() {
  return {
    rolle: undefined,
    privilegien: undefined,
  };
}
export function fakeAnteilshaberComplete() {
  return {
    id: faker.number.int(),
    benutzer_id: faker.number.int(),
    gebaeude_id: faker.number.int(),
    rolle: undefined,
    privilegien: undefined,
    uid: '[object Object]',
  };
}
export function fakeApiRequests() {
  return {
    ip: faker.lorem.words(5),
    method: faker.lorem.words(5),
    path: faker.lorem.words(5),
    status: faker.number.int(),
    responseTime: faker.number.float(),
    responseSize: faker.number.int(),
    userAgent: faker.lorem.words(5),
  };
}
export function fakeApiRequestsComplete() {
  return {
    id: faker.number.int(),
    date: new Date(),
    ip: faker.lorem.words(5),
    method: faker.lorem.words(5),
    path: faker.lorem.words(5),
    status: faker.number.int(),
    responseTime: faker.number.float(),
    responseSize: faker.number.int(),
    userAgent: faker.lorem.words(5),
    user_id: undefined,
  };
}
export function fakeBedarfsausweisWohnen() {
  return {
    erstellungsdatum: undefined,
    ausstellgrund: undefined,
    registriernummer: undefined,
    erledigt: undefined,
    saniert: undefined,
    baujahr: [faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int()],
    einheiten: undefined,
    wohnflaeche: undefined,
    keller_beheizt: undefined,
    dachgeschoss_beheizt: undefined,
    lueftungskonzept: undefined,
    leerstand: undefined,
    versorgungssysteme: undefined,
    fenster_dach: undefined,
    energiequelle_2_nutzung: undefined,
    daemmung: undefined,
    anzahl_vollgeschosse: undefined,
    geschosshoehe: undefined,
    anzahl_gauben: undefined,
    breite_gauben: undefined,
    masse_a: undefined,
    masse_b: undefined,
    masse_c: undefined,
    masse_d: undefined,
    masse_e: undefined,
    masse_f: undefined,
    fensterflaeche_so_sw: undefined,
    fensterflaeche_nw_no: undefined,
    aussenwandflaeche_unbeheizt: undefined,
    dachflaeche: undefined,
    deckenflaeche: undefined,
    dach_u_wert: undefined,
    decke_u_wert: undefined,
    aussenwand_flaeche: undefined,
    aussenwand_u_wert: undefined,
    fussboden_flaeche: undefined,
    fussboden_u_wert: undefined,
    volumen: undefined,
    dicht: undefined,
    fenster_flaeche_1: undefined,
    fenster_art_1: undefined,
    fenster_flaeche_2: undefined,
    fenster_art_2: undefined,
    dachfenster_flaeche: undefined,
    dachfenster_art: undefined,
    haustuer_flaeche: undefined,
    haustuer_art: undefined,
    dach_bauart: undefined,
    decke_bauart: undefined,
    dach_daemmung: undefined,
    decke_daemmung: undefined,
    aussenwand_daemmung: undefined,
    boden_daemmung: undefined,
    aussenwand_bauart: undefined,
    boden_bauart: undefined,
    warmwasser_verteilung: undefined,
    warmwasser_speicherung: undefined,
    warmwasser_erzeugung: undefined,
    heizung_zentral: undefined,
    heizung_verteilung: undefined,
    heizung_speicherung: undefined,
    waerme_erzeugung_heizung: undefined,
    anteil_zusatzheizung: undefined,
    kollektor_flaeche: undefined,
    vanw_stromverbrauch_enthalten: undefined,
    wird_gekuehlt: undefined,
  };
}
export function fakeBedarfsausweisWohnenComplete() {
  return {
    id: faker.number.int(),
    uid: '[object Object]',
    gebaeude_stammdaten_id: faker.number.int(),
    benutzer_id: faker.number.int(),
    rechnungen_id: undefined,
    erstellungsdatum: undefined,
    ausstellgrund: undefined,
    registriernummer: undefined,
    erledigt: undefined,
    saniert: undefined,
    baujahr: [faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int()],
    einheiten: undefined,
    wohnflaeche: undefined,
    keller_beheizt: undefined,
    dachgeschoss_beheizt: undefined,
    lueftungskonzept: undefined,
    leerstand: undefined,
    versorgungssysteme: undefined,
    fenster_dach: undefined,
    energiequelle_2_nutzung: undefined,
    daemmung: undefined,
    anzahl_vollgeschosse: undefined,
    geschosshoehe: undefined,
    anzahl_gauben: undefined,
    breite_gauben: undefined,
    masse_a: undefined,
    masse_b: undefined,
    masse_c: undefined,
    masse_d: undefined,
    masse_e: undefined,
    masse_f: undefined,
    fensterflaeche_so_sw: undefined,
    fensterflaeche_nw_no: undefined,
    aussenwandflaeche_unbeheizt: undefined,
    dachflaeche: undefined,
    deckenflaeche: undefined,
    dach_u_wert: undefined,
    decke_u_wert: undefined,
    aussenwand_flaeche: undefined,
    aussenwand_u_wert: undefined,
    fussboden_flaeche: undefined,
    fussboden_u_wert: undefined,
    volumen: undefined,
    dicht: undefined,
    fenster_flaeche_1: undefined,
    fenster_art_1: undefined,
    fenster_flaeche_2: undefined,
    fenster_art_2: undefined,
    dachfenster_flaeche: undefined,
    dachfenster_art: undefined,
    haustuer_flaeche: undefined,
    haustuer_art: undefined,
    dach_bauart: undefined,
    decke_bauart: undefined,
    dach_daemmung: undefined,
    decke_daemmung: undefined,
    aussenwand_daemmung: undefined,
    boden_daemmung: undefined,
    aussenwand_bauart: undefined,
    boden_bauart: undefined,
    warmwasser_verteilung: undefined,
    warmwasser_speicherung: undefined,
    warmwasser_erzeugung: undefined,
    heizung_zentral: undefined,
    heizung_verteilung: undefined,
    heizung_speicherung: undefined,
    waerme_erzeugung_heizung: undefined,
    anteil_zusatzheizung: undefined,
    kollektor_flaeche: undefined,
    vanw_stromverbrauch_enthalten: undefined,
    wird_gekuehlt: undefined,
    ausweisart: Ausweisart.BedarfsausweisWohnen,
  };
}
export function fakeBenutzer() {
  return {
    name: undefined,
    vorname: undefined,
    email: faker.internet.email(),
    passwort: faker.lorem.words(5),
    profilbild: undefined,
    plz: undefined,
    ort: undefined,
    adresse: undefined,
    telefon: undefined,
    anrede: undefined,
  };
}
export function fakeBenutzerComplete() {
  return {
    id: faker.number.int(),
    uid: '[object Object]',
    name: undefined,
    vorname: undefined,
    email: faker.internet.email(),
    passwort: faker.lorem.words(5),
    profilbild: undefined,
    plz: undefined,
    ort: undefined,
    adresse: undefined,
    telefon: undefined,
    anrede: undefined,
    rolle: BenutzerRolle.USER,
  };
}
export function fakedocumenttemplates() {
  return {
    name: faker.person.fullName(),
    shortdescription: faker.lorem.words(5),
    longdescription: faker.lorem.words(5),
    filename: faker.lorem.words(5),
  };
}
export function fakedocumenttemplatesComplete() {
  return {
    id: faker.number.int(),
    name: faker.person.fullName(),
    shortdescription: faker.lorem.words(5),
    longdescription: faker.lorem.words(5),
    user_id: faker.number.int(),
    is_private: true,
    documenttype: faker.number.int(),
    filename: faker.lorem.words(5),
    created_at: new Date(),
    updated_at: new Date(),
  };
}
export function fakedocumenttypes() {
  return {
    name: faker.person.fullName(),
    shortdescription: faker.lorem.words(5),
    longdescription: faker.lorem.words(5),
  };
}
export function fakedocumenttypesComplete() {
  return {
    id: faker.number.int(),
    name: faker.person.fullName(),
    shortdescription: faker.lorem.words(5),
    longdescription: faker.lorem.words(5),
  };
}
export function fakeGebaeudeBilder() {
  return {
    kategorie: faker.lorem.words(5),
  };
}
export function fakeGebaeudeBilderComplete() {
  return {
    id: faker.number.int(),
    gebaeude_stammdaten_id: faker.number.int(),
    kategorie: faker.lorem.words(5),
    uid: '[object Object]',
  };
}
export function fakeGebaeudePlaeneComplete() {
  return {
    id: faker.number.int(),
    gebaeude_stammdaten_id: faker.number.int(),
    uid: '[object Object]',
  };
}
export function fakeGebaeudeStammdaten() {
  return {
    gebaeudetyp: undefined,
    gebaeudeteil: undefined,
    baujahr_gebaeude: [faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int()],
    baujahr_heizung: [faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int()],
    baujahr_klima: [faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int()],
    einheiten: undefined,
    flaeche: undefined,
    saniert: undefined,
    keller: undefined,
    dachgeschoss: undefined,
    lueftung: undefined,
    kuehlung: undefined,
    leerstand: undefined,
    plz: undefined,
    ort: undefined,
    adresse: undefined,
    zentralheizung: undefined,
    solarsystem_warmwasser: undefined,
    warmwasser_rohre_gedaemmt: undefined,
    niedertemperatur_kessel: undefined,
    brennwert_kessel: undefined,
    heizungsrohre_gedaemmt: undefined,
    standard_kessel: undefined,
    waermepumpe: undefined,
    raum_temperatur_regler: undefined,
    photovoltaik: undefined,
    durchlauf_erhitzer: undefined,
    einzelofen: undefined,
    zirkulation: undefined,
    einfach_verglasung: undefined,
    dreifach_verglasung: undefined,
    fenster_teilweise_undicht: undefined,
    doppel_verglasung: undefined,
    fenster_dicht: undefined,
    rolllaeden_kaesten_gedaemmt: undefined,
    isolier_verglasung: undefined,
    tueren_undicht: undefined,
    tueren_dicht: undefined,
    dachgeschoss_gedaemmt: undefined,
    keller_decke_gedaemmt: undefined,
    keller_wand_gedaemmt: undefined,
    aussenwand_gedaemmt: undefined,
    oberste_geschossdecke_gedaemmt: undefined,
    aussenwand_min_12cm_gedaemmt: undefined,
    dachgeschoss_min_12cm_gedaemmt: undefined,
    oberste_geschossdecke_min_12cm_gedaemmt: undefined,
  };
}
export function fakeGebaeudeStammdatenComplete() {
  return {
    id: faker.number.int(),
    uid: '[object Object]',
    benutzer_id: undefined,
    gebaeudetyp: undefined,
    gebaeudeteil: undefined,
    baujahr_gebaeude: [faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int()],
    baujahr_heizung: [faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int()],
    baujahr_klima: [faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int()],
    einheiten: undefined,
    flaeche: undefined,
    saniert: undefined,
    keller: undefined,
    dachgeschoss: undefined,
    lueftung: undefined,
    kuehlung: undefined,
    leerstand: undefined,
    plz: undefined,
    ort: undefined,
    adresse: undefined,
    zentralheizung: undefined,
    solarsystem_warmwasser: undefined,
    warmwasser_rohre_gedaemmt: undefined,
    niedertemperatur_kessel: undefined,
    brennwert_kessel: undefined,
    heizungsrohre_gedaemmt: undefined,
    standard_kessel: undefined,
    waermepumpe: undefined,
    raum_temperatur_regler: undefined,
    photovoltaik: undefined,
    durchlauf_erhitzer: undefined,
    einzelofen: undefined,
    zirkulation: undefined,
    einfach_verglasung: undefined,
    dreifach_verglasung: undefined,
    fenster_teilweise_undicht: undefined,
    doppel_verglasung: undefined,
    fenster_dicht: undefined,
    rolllaeden_kaesten_gedaemmt: undefined,
    isolier_verglasung: undefined,
    tueren_undicht: undefined,
    tueren_dicht: undefined,
    dachgeschoss_gedaemmt: undefined,
    keller_decke_gedaemmt: undefined,
    keller_wand_gedaemmt: undefined,
    aussenwand_gedaemmt: undefined,
    oberste_geschossdecke_gedaemmt: undefined,
    aussenwand_min_12cm_gedaemmt: undefined,
    dachgeschoss_min_12cm_gedaemmt: undefined,
    oberste_geschossdecke_min_12cm_gedaemmt: undefined,
  };
}
export function fakeKlimafaktoren() {
  return {
    plz: faker.lorem.words(5),
    month: faker.number.int(),
    year: faker.number.int(),
  };
}
export function fakeKlimafaktorenComplete() {
  return {
    id: faker.number.int(),
    plz: faker.lorem.words(5),
    month: faker.number.int(),
    year: faker.number.int(),
    klimafaktor: 1,
  };
}
export function fakePostleitzahlen() {
  return {
    plz: faker.lorem.words(5),
    stadt: faker.lorem.words(5),
    bundesland: faker.lorem.words(5),
  };
}
export function fakePostleitzahlenComplete() {
  return {
    id: faker.number.int(),
    plz: faker.lorem.words(5),
    stadt: faker.lorem.words(5),
    bundesland: faker.lorem.words(5),
  };
}
export function fakeRechnungen() {
  return {
    empfaenger: undefined,
    strasse: undefined,
    plz: undefined,
    ort: undefined,
    zusatzzeile: undefined,
    telefon: undefined,
    email: undefined,
    versand_empfaenger: undefined,
    versand_strasse: undefined,
    versand_plz: undefined,
    versand_ort: undefined,
    versand_zusatzzeile: undefined,
    bezahlmethode: faker.helpers.arrayElement([Bezahlmethoden.PAYPAL, Bezahlmethoden.GIROPAY, Bezahlmethoden.SOFORT, Bezahlmethoden.KREDITKARTE, Bezahlmethoden.RECHNUNG] as const),
    status: faker.helpers.arrayElement([Rechnungsstatus.open, Rechnungsstatus.canceled, Rechnungsstatus.pending, Rechnungsstatus.authorized, Rechnungsstatus.expired, Rechnungsstatus.failed, Rechnungsstatus.paid] as const),
    services: faker.helpers.arrayElement([Service.Telefonberatung, Service.Aushang, Service.Qualitaetsdruck, Service.SameDay] as const),
    betrag: faker.number.float(),
    bezahlt_am: undefined,
    storniert_am: undefined,
    transaktions_referenz: undefined,
  };
}
export function fakeRechnungenComplete() {
  return {
    id: faker.number.int(),
    uid: '[object Object]',
    benutzer_id: faker.number.int(),
    empfaenger: undefined,
    strasse: undefined,
    plz: undefined,
    ort: undefined,
    zusatzzeile: undefined,
    telefon: undefined,
    email: undefined,
    abweichende_versand_adresse: false,
    versand_empfaenger: undefined,
    versand_strasse: undefined,
    versand_plz: undefined,
    versand_ort: undefined,
    versand_zusatzzeile: undefined,
    bezahlmethode: faker.helpers.arrayElement([Bezahlmethoden.PAYPAL, Bezahlmethoden.GIROPAY, Bezahlmethoden.SOFORT, Bezahlmethoden.KREDITKARTE, Bezahlmethoden.RECHNUNG] as const),
    status: faker.helpers.arrayElement([Rechnungsstatus.open, Rechnungsstatus.canceled, Rechnungsstatus.pending, Rechnungsstatus.authorized, Rechnungsstatus.expired, Rechnungsstatus.failed, Rechnungsstatus.paid] as const),
    services: faker.helpers.arrayElement([Service.Telefonberatung, Service.Aushang, Service.Qualitaetsdruck, Service.SameDay] as const),
    betrag: faker.number.float(),
    erstellt_am: new Date(),
    bezahlt_am: undefined,
    storniert_am: undefined,
    transaktions_referenz: undefined,
  };
}
export function fakeRefreshTokens() {
  return {
    token: faker.lorem.words(5),
    ip: faker.lorem.words(5),
    expiry: faker.date.anytime(),
  };
}
export function fakeRefreshTokensComplete() {
  return {
    id: faker.number.int(),
    token: faker.lorem.words(5),
    uid: faker.string.uuid(),
    ip: faker.lorem.words(5),
    expiry: faker.date.anytime(),
  };
}
export function faketokens() {
  return {
    token: faker.lorem.words(5),
  };
}
export function faketokensComplete() {
  return {
    id: faker.number.int(),
    token: faker.lorem.words(5),
    user_id: faker.number.int(),
    date_created: new Date(),
    last_used: new Date(),
    times_used: 0,
    permissions: 0,
  };
}
export function fakeVerbrauchsausweisGewerbe() {
  return {
    ausstellgrund: undefined,
  };
}
export function fakeVerbrauchsausweisGewerbeComplete() {
  return {
    id: faker.number.int(),
    uid: '[object Object]',
    gebaeude_stammdaten_id: faker.number.int(),
    rechnungen_id: undefined,
    benutzer_id: faker.number.int(),
    ausstellgrund: undefined,
    ausweisart: Ausweisart.VerbrauchsausweisGewerbe,
  };
}
export function fakeVerbrauchsausweisWohnen() {
  return {
    erstellungsdatum: undefined,
    ausstellgrund: undefined,
    registriernummer: undefined,
    erledigt: undefined,
    baujahr_heizung: [faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int()],
    zusaetzliche_heizquelle: undefined,
    brennstoff_1: undefined,
    einheit_1: undefined,
    brennstoff_2: undefined,
    einheit_2: undefined,
    startdatum: undefined,
    verbrauch_1: undefined,
    verbrauch_2: undefined,
    verbrauch_3: undefined,
    verbrauch_4: undefined,
    verbrauch_5: undefined,
    verbrauch_6: undefined,
    warmwasser_enthalten: undefined,
    warmwasser_anteil_bekannt: undefined,
    wird_gekuehlt: undefined,
    keller_beheizt: undefined,
    alternative_heizung: undefined,
    alternative_warmwasser: undefined,
    alternative_lueftung: undefined,
    alternative_kuehlung: undefined,
    anteil_warmwasser_1: undefined,
    anteil_warmwasser_2: undefined,
  };
}
export function fakeVerbrauchsausweisWohnenComplete() {
  return {
    id: faker.number.int(),
    uid: '[object Object]',
    gebaeude_stammdaten_id: faker.number.int(),
    benutzer_id: undefined,
    rechnungen_id: undefined,
    erstellungsdatum: undefined,
    ausstellgrund: undefined,
    registriernummer: undefined,
    erledigt: undefined,
    baujahr_heizung: [faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int()],
    zusaetzliche_heizquelle: undefined,
    brennstoff_1: undefined,
    einheit_1: undefined,
    brennstoff_2: undefined,
    einheit_2: undefined,
    startdatum: undefined,
    verbrauch_1: undefined,
    verbrauch_2: undefined,
    verbrauch_3: undefined,
    verbrauch_4: undefined,
    verbrauch_5: undefined,
    verbrauch_6: undefined,
    warmwasser_enthalten: undefined,
    warmwasser_anteil_bekannt: undefined,
    wird_gekuehlt: undefined,
    keller_beheizt: undefined,
    alternative_heizung: undefined,
    alternative_warmwasser: undefined,
    alternative_lueftung: undefined,
    alternative_kuehlung: undefined,
    ausweisart: Ausweisart.VerbrauchsausweisWohnen,
    anteil_warmwasser_1: undefined,
    anteil_warmwasser_2: undefined,
  };
}
