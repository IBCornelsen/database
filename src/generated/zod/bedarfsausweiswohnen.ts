import * as z from "zod"
import { Ausstellgrund } from "@prisma/client"

export const BedarfsausweisWohnenSchema = z.object({
  id: z.number().int(),
  uid: z.string(),
  benutzer_id: z.number().int().nullish(),
  ausstellgrund: z.nativeEnum(Ausstellgrund).nullish(),
  registriernummer: z.string().nullish(),
  alternative_heizung: z.boolean().nullish(),
  alternative_warmwasser: z.boolean().nullish(),
  alternative_lueftung: z.boolean().nullish(),
  alternative_kuehlung: z.boolean().nullish(),
  anzahl_vollgeschosse: z.number().int().nullish(),
  geschosshoehe: z.number().nullish(),
  anzahl_gauben: z.number().int().nullish(),
  breite_gauben: z.number().nullish(),
  masse_a: z.number().nullish(),
  masse_b: z.number().nullish(),
  masse_c: z.number().nullish(),
  masse_d: z.number().nullish(),
  masse_e: z.number().nullish(),
  masse_f: z.number().nullish(),
  fensterflaeche_so_sw: z.number().nullish(),
  fensterflaeche_nw_no: z.number().nullish(),
  aussenwandflaeche_unbeheizt: z.number().nullish(),
  dachflaeche: z.number().nullish(),
  deckenflaeche: z.number().nullish(),
  dach_u_wert: z.number().nullish(),
  decke_u_wert: z.number().nullish(),
  aussenwand_flaeche: z.number().nullish(),
  aussenwand_u_wert: z.number().nullish(),
  fussboden_flaeche: z.number().nullish(),
  fussboden_u_wert: z.number().nullish(),
  volumen: z.number().nullish(),
  dicht: z.boolean().nullish(),
  fenster_flaeche_1: z.number().nullish(),
  fenster_art_1: z.number().nullish(),
  fenster_flaeche_2: z.number().nullish(),
  fenster_art_2: z.number().nullish(),
  dachfenster_flaeche: z.number().nullish(),
  dachfenster_art: z.number().nullish(),
  haustuer_flaeche: z.number().nullish(),
  haustuer_art: z.number().nullish(),
  dach_bauart: z.string().nullish(),
  decke_bauart: z.string().nullish(),
  dach_daemmung: z.number().nullish(),
  decke_daemmung: z.number().nullish(),
  aussenwand_daemmung: z.number().nullish(),
  boden_daemmung: z.number().nullish(),
  aussenwand_bauart: z.string().nullish(),
  boden_bauart: z.string().nullish(),
  warmwasser_verteilung: z.string().nullish(),
  warmwasser_speicherung: z.string().nullish(),
  warmwasser_erzeugung: z.string().nullish(),
  heizung_zentral: z.boolean().nullish(),
  heizung_verteilung: z.string().nullish(),
  heizung_speicherung: z.string().nullish(),
  waerme_erzeugung_heizung: z.string().nullish(),
  anteil_zusatzheizung: z.number().nullish(),
  kollektor_flaeche: z.number().nullish(),
  ausgestellt: z.boolean().nullish(),
  storniert: z.boolean().describe("Falls der Ausweis storniert wurde, sollte dieser Wert auf true stehen").nullish(),
  bestellt: z.boolean().describe("Falls der Ausweis bestellt wurde, sollte dieser Wert auf true stehen").nullish(),
  zurueckgestellt: z.boolean().describe("Falls der Ausweis vom Aussteller zurückgestellt wurde, sollte dieser Wert auf true stehen").nullish(),
  prueftext: z.string().describe("Durch den Kunden hinzugefügte Anmerkung zur Vorabprüfung").nullish(),
  beschreibung: z.string().nullish(),
  geg_anfrage: z.boolean().describe("Gibt an, ob ein Ausweis eine GEG Nachweis Anfrage repräsentiert").nullish(),
  aufnahme_id: z.number().int().describe("ID der korrespondierenden Gebäudeaufnahme"),
})
