import * as z from "zod"
import { Ausstellgrund } from "@prisma/client"

export const VerbrauchsausweisWohnenSchema = z.object({
  id: z.number().int(),
  uid: z.string().describe("UID des Ausweises"),
  benutzer_id: z.number().int().describe("Die ID des Benutzers, welchem dieser Ausweis gehört").nullish(),
  ausstellgrund: z.nativeEnum(Ausstellgrund).describe("Ausstellgrund wie z.B. Vermietung oder Verkauf").nullish(),
  registriernummer: z.string().describe("Die Registriernummer des Ausweises").nullish(),
  zusaetzliche_heizquelle: z.boolean().describe("Falls eine sekundäre Heizquelle existiert, sollte dieser Wert auf true stehen").nullish(),
  einheit_1: z.string().describe("Einheit des Energieträgers der primären Heizquelle").nullish(),
  einheit_2: z.string().describe("Einheit des Energieträgers der sekundären Heizquelle").nullish(),
  startdatum: z.date().nullish(),
  verbrauch_1: z.number().int().describe("Energieverbrauch der primären Heizquelle im ersten der drei Verbrauchsjahre").nullish(),
  verbrauch_2: z.number().int().describe("Energieverbrauch der primären Heizquelle im zweiten der drei Verbrauchsjahre").nullish(),
  verbrauch_3: z.number().int().describe("Energieverbrauch der primären Heizquelle im letzten der drei Verbrauchsjahre").nullish(),
  verbrauch_4: z.number().int().describe("Energieverbrauch der sekund̈́ären Heizquelle im ersten der drei Verbrauchsjahre").nullish(),
  verbrauch_5: z.number().int().describe("Energieverbrauch der sekund̈́ären Heizquelle im zweiten der drei Verbrauchsjahre").nullish(),
  verbrauch_6: z.number().int().describe("Energieverbrauch der sekund̈́ären Heizquelle im letzten der drei Verbrauchsjahre").nullish(),
  warmwasser_enthalten: z.boolean().describe("Falls Warmwasser im Verbrauchswert enthalten ist, sollte dieser Wert auf true stehen").nullish(),
  warmwasser_anteil_bekannt: z.boolean().describe("Falls der Warmwasser Anteil am Verbrauch bekannt ist, sollte dieser Wert auf true stehen").nullish(),
  keller_beheizt: z.boolean().describe("Falls der Keller des Gebäudes beheizt wird, sollte dieser Wert auf true stehen").nullish(),
  faktorKeller: z.number().describe("Der Faktor mit dem die Wohnfläche erhöht wird wenn die beheizte Gesamtfläche (energetische Nutzfläche) unbekannt ist.").nullish(),
  alternative_heizung: z.boolean().describe("Falls der Heizungsverbrauch alternative Energieversorgungssysteme beinhaltet, sollte dieser Wert auf true stehen.").nullish(),
  alternative_warmwasser: z.boolean().describe("Falls der Warmwasserverbrauch alternative Energieversorgungssysteme (z.B. Solarsystem, Wärmepumpe, etc.) beinhaltet, sollte dieser Wert auf true stehen.").nullish(),
  alternative_lueftung: z.boolean().describe("Falls die Lüftung alternative Energieversorgungssysteme beinhaltet sollte dieser Wert auf true stehen.").nullish(),
  alternative_kuehlung: z.boolean().describe("Falls die Kühlung alternative Energieversorgungssysteme beinhaltet sollte dieser Wert auf true stehen.").nullish(),
  anteil_warmwasser_1: z.number().describe("Anteil des Warmwassers am Gesamtverbrauch der primären Energiequelle in Prozent").nullish(),
  anteil_warmwasser_2: z.number().describe("Anteil des Warmwassers am Gesamtverbrauch der sekundären Energiequelle in Prozent").nullish(),
  ausgestellt: z.boolean().nullish(),
  storniert: z.boolean().describe("Falls der Ausweis storniert wurde, sollte dieser Wert auf true stehen").nullish(),
  bestellt: z.boolean().describe("Falls der Ausweis bestellt wurde, sollte dieser Wert auf true stehen").nullish(),
  zurueckgestellt: z.boolean().describe("Falls der Ausweis vom Aussteller zurückgestellt wurde, sollte dieser Wert auf true stehen").nullish(),
  prueftext: z.string().describe("Durch den Kunden hinzugefügte Anmerkung zur Vorabprüfung").nullish(),
  beschreibung: z.string().nullish(),
  kontrolldatei_angefragt: z.boolean().describe("Ob bei der Anfrage der Registriernummer eine Kontrolldatei angefragt wurde").nullish(),
  rechnung_id: z.number().int().nullish(),
  aufnahme_id: z.number().int().describe("ID der korrespondierenden Gebäudeaufnahme"),
})
