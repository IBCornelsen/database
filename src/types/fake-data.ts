import {  } from '/home/letsmoe/Documents/IBCornelsen/IBCornelsen/database/node_modules/@prisma/client';
import { faker } from '@faker-js/faker';



export function fakePostleitzahlenComplete() {
  return {
    id: faker.number.int(),
  };
}
export function fakeAdressen() {
  return {
    empfaenger_zeile_1: faker.lorem.words(5),
    empfaenger_zeile_2: undefined,
    strasse: faker.lorem.words(5),
    plz: faker.lorem.words(5),
    ort: faker.lorem.words(5),
    geolocation: undefined,
  };
}
export function fakeAdressenComplete() {
  return {
    id: faker.number.int(),
    benutzer_id: faker.number.int(),
    empfaenger_zeile_1: faker.lorem.words(5),
    empfaenger_zeile_2: undefined,
    strasse: faker.lorem.words(5),
    plz: faker.lorem.words(5),
    ort: faker.lorem.words(5),
    geolocation: undefined,
    uid: '[object Object]',
  };
}
export function fakeAnteilshaber() {
  return {
    rolle: undefined,
    privilegien: undefined,
    uid: undefined,
  };
}
export function fakeAnteilshaberComplete() {
  return {
    id: faker.number.int(),
    benutzer_id: faker.number.int(),
    gebaeude_id: faker.number.int(),
    rolle: undefined,
    privilegien: undefined,
    uid: undefined,
  };
}
export function fakeBedarfsausweisWohnen() {
  return {
    ausweisart: faker.lorem.words(5),
    erstellungsdatum: undefined,
    ausstellgrund: faker.lorem.words(5),
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
    ausweisart: faker.lorem.words(5),
    erstellungsdatum: undefined,
    ausstellgrund: faker.lorem.words(5),
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
export function fakeBenutzer() {
  return {
    name: undefined,
    vorname: undefined,
    email: faker.internet.email(),
    passwort: faker.lorem.words(5),
    profilbild: undefined,
    uid: undefined,
  };
}
export function fakeBenutzerComplete() {
  return {
    id: faker.number.int(),
    name: undefined,
    vorname: undefined,
    email: faker.internet.email(),
    passwort: faker.lorem.words(5),
    profilbild: undefined,
    benutzer_adresse_id: undefined,
    rechnung_adresse_id: undefined,
    versand_adresse_id: undefined,
    uid: undefined,
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
export function fakeGebaeudePlaene() {
  return {
    uid: faker.lorem.words(5),
  };
}
export function fakeGebaeudePlaeneComplete() {
  return {
    id: faker.number.int(),
    gebaeude_stammdaten_id: faker.number.int(),
    uid: faker.lorem.words(5),
  };
}
export function fakeGebaeudeStammdaten() {
  return {
    gebaeudetyp: undefined,
    gebaeudeteil: undefined,
    baujahr_gebaeude: [faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int()],
    baujahr_heizung: undefined,
    baujahr_klima: undefined,
    einheiten: undefined,
    flaeche: undefined,
    saniert: undefined,
    keller: undefined,
    dachgeschoss: undefined,
    lueftung: undefined,
    kuehlung: undefined,
    leerstand: undefined,
  };
}
export function fakeGebaeudeStammdatenComplete() {
  return {
    id: faker.number.int(),
    uid: '[object Object]',
    benutzer_id: undefined,
    gebaeude_adresse_id: undefined,
    gebaeudetyp: undefined,
    gebaeudeteil: undefined,
    baujahr_gebaeude: [faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int()],
    baujahr_heizung: undefined,
    baujahr_klima: undefined,
    einheiten: undefined,
    flaeche: undefined,
    saniert: undefined,
    keller: undefined,
    dachgeschoss: undefined,
    lueftung: undefined,
    kuehlung: undefined,
    leerstand: undefined,
  };
}
export function fakeKlimafaktoren() {
  return {
    zip: faker.lorem.words(5),
  };
}
export function fakeKlimafaktorenComplete() {
  return {
    zip: faker.lorem.words(5),
    d_02_2008: 1,
    d_03_2008: 1,
    d_04_2008: 1,
    d_05_2008: 1,
    d_06_2008: 1,
    d_07_2008: 1,
    d_08_2008: 1,
    d_09_2008: 1,
    d_10_2008: 1,
    d_11_2008: 1,
    d_12_2008: 1,
    d_01_2009: 1,
    d_02_2009: 1,
    d_03_2009: 1,
    d_04_2009: 1,
    d_05_2009: 1,
    d_06_2009: 1,
    d_07_2009: 1,
    d_08_2009: 1,
    d_09_2009: 1,
    d_10_2009: 1,
    d_11_2009: 1,
    d_12_2009: 1,
    d_01_2010: 1,
    d_02_2010: 1,
    d_03_2010: 1,
    d_04_2010: 1,
    d_05_2010: 1,
    d_06_2010: 1,
    d_07_2010: 1,
    d_08_2010: 1,
    d_09_2010: 1,
    d_10_2010: 1,
    d_11_2010: 1,
    d_12_2010: 1,
    d_01_2011: 1,
    d_02_2011: 1,
    d_03_2011: 1,
    d_04_2011: 1,
    d_05_2011: 1,
    d_06_2011: 1,
    d_07_2011: 1,
    d_08_2011: 1,
    d_09_2011: 1,
    d_10_2011: 1,
    d_11_2011: 1,
    d_12_2011: 1,
    d_01_2012: 1,
    d_02_2012: 1,
    d_03_2012: 1,
    d_04_2012: 1,
    d_05_2012: 1,
    d_06_2012: 1,
    d_07_2012: 1,
    d_08_2012: 1,
    d_09_2012: 1,
    d_10_2012: 1,
    d_11_2012: 1,
    d_12_2012: 1,
    d_01_2013: 1,
    d_02_2013: 1,
    d_03_2013: 1,
    d_04_2013: 1,
    d_05_2013: 1,
    d_06_2013: 1,
    d_07_2013: 1,
    d_08_2013: 1,
    d_09_2013: 1,
    d_10_2013: 1,
    d_11_2013: 1,
    d_12_2013: 1,
    d_01_2014: 1,
    d_02_2014: 1,
    d_03_2014: 1,
    d_04_2014: 1,
    d_05_2014: 1,
    d_06_2014: 1,
    d_07_2014: 1,
    d_08_2014: 1,
    d_09_2014: 1,
    d_10_2014: 1,
    d_11_2014: 1,
    d_12_2014: 1,
    d_01_2015: 1,
    d_02_2015: 1,
    d_03_2015: 1,
    d_04_2015: 1,
    d_05_2015: 1,
    d_06_2015: 1,
    d_07_2015: 1,
    d_08_2015: 1,
    d_09_2015: 1,
    d_10_2015: 1,
    d_11_2015: 1,
    d_12_2015: 1,
    d_01_2016: 1,
    d_02_2016: 1,
    d_03_2016: 1,
    d_04_2016: 1,
    d_05_2016: 1,
    d_06_2016: 1,
    d_07_2016: 1,
    d_08_2016: 1,
    d_09_2016: 1,
    d_10_2016: 1,
    d_11_2016: 1,
    d_12_2016: 1,
    d_01_2017: 1,
    d_02_2017: 1,
    d_03_2017: 1,
    d_04_2017: 1,
    d_05_2017: 1,
    d_06_2017: 1,
    d_07_2017: 1,
    d_08_2017: 1,
    d_09_2017: 1,
    d_10_2017: 1,
    d_11_2017: 1,
    d_12_2017: 1,
    d_01_2018: 1,
    d_02_2018: 1,
    d_03_2018: 1,
    d_04_2018: 1,
    d_05_2018: 1,
    d_06_2018: 1,
    d_07_2018: 1,
    d_08_2018: 1,
    d_09_2018: 1,
    d_10_2018: 1,
    d_11_2018: 1,
    d_12_2018: 1,
    d_01_2019: 1,
    d_02_2019: 1,
    d_03_2019: 1,
    d_04_2019: 1,
    d_05_2019: 1,
    d_06_2019: 1,
    d_07_2019: 1,
    d_08_2019: 1,
    d_09_2019: 1,
    d_10_2019: 1,
    d_11_2019: 1,
    d_12_2019: 1,
    d_01_2020: 1,
    d_02_2020: 1,
    d_03_2020: 1,
    d_04_2020: 1,
    d_05_2020: 1,
    d_06_2020: 1,
    d_07_2020: 1,
    d_08_2020: 1,
    d_09_2020: 1,
    d_10_2020: 1,
    d_11_2020: 1,
    d_12_2020: 1,
    d_01_2021: 1,
    d_02_2021: 1,
    d_03_2021: 1,
    d_04_2021: 1,
    d_05_2021: 1,
    d_06_2021: 1,
    d_07_2021: 1,
    d_08_2021: 1,
    d_09_2021: 1,
    d_10_2021: 1,
    d_11_2021: 1,
    d_12_2021: 1,
    d_01_2022: 1,
  };
}
export function fakeRechnungen() {
  return {
    empfaenger_zeile_1: undefined,
    empfaenger_zeile_2: undefined,
    strasse: faker.lorem.words(5),
    plz: undefined,
    ort: undefined,
    uid: faker.lorem.words(5),
  };
}
export function fakeRechnungenComplete() {
  return {
    id: faker.number.int(),
    benutzer_id: faker.number.int(),
    empfaenger_zeile_1: undefined,
    empfaenger_zeile_2: undefined,
    strasse: faker.lorem.words(5),
    plz: undefined,
    ort: undefined,
    uid: faker.lorem.words(5),
  };
}
export function fakeTokenUsage() {
  return {
    resource_hash: faker.lorem.words(5),
    payload_length: faker.number.int(),
    response_length: faker.number.int(),
    response_success: faker.datatype.boolean(),
    response_code: faker.number.int(),
  };
}
export function fakeTokenUsageComplete() {
  return {
    id: faker.number.int(),
    token_id: faker.number.int(),
    date: new Date(),
    resource_hash: faker.lorem.words(5),
    payload_length: faker.number.int(),
    response_length: faker.number.int(),
    response_success: faker.datatype.boolean(),
    response_code: faker.number.int(),
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
    uid: faker.lorem.words(5),
  };
}
export function fakeVerbrauchsausweisGewerbeComplete() {
  return {
    id: faker.number.int(),
    uid: faker.lorem.words(5),
    gebaeude_stammdaten_id: faker.number.int(),
    rechnungen_id: undefined,
    benutzer_id: faker.number.int(),
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
    enddatum: undefined,
    verbrauch_1: undefined,
    verbrauch_2: undefined,
    verbrauch_3: undefined,
    verbrauch_4: undefined,
    verbrauch_5: undefined,
    verbrauch_6: undefined,
    warmwasser_enthalten: undefined,
    anteil_warmwasser_1: undefined,
    anteil_warmwasser_2: undefined,
  };
}
export function fakeVerbrauchsausweisWohnenComplete() {
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
    baujahr_heizung: [faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int(),faker.number.int()],
    zusaetzliche_heizquelle: undefined,
    brennstoff_1: undefined,
    einheit_1: undefined,
    brennstoff_2: undefined,
    einheit_2: undefined,
    startdatum: undefined,
    enddatum: undefined,
    verbrauch_1: undefined,
    verbrauch_2: undefined,
    verbrauch_3: undefined,
    verbrauch_4: undefined,
    verbrauch_5: undefined,
    verbrauch_6: undefined,
    warmwasser_enthalten: undefined,
    anteil_warmwasser_1: undefined,
    anteil_warmwasser_2: undefined,
  };
}
