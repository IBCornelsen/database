import * as z from "zod"
import * as imports from "../../../prisma/null"
import { Ausstellgrund } from "@prisma/client"

export const VerbrauchsausweisGewerbeSchema = z.object({
  id: z.number().int(),
  uid: z.string(),
  benutzer_id: z.number().int().nullish(),
  ausstellgrund: z.nativeEnum(Ausstellgrund).nullish(),
  registriernummer: z.string().nullish(),
  zusaetzliche_heizquelle: z.boolean().nullish(),
  brennstoff_1: z.string().nullish(),
  einheit_1: z.string().nullish(),
  brennstoff_2: z.string().nullish(),
  einheit_2: z.string().nullish(),
  startdatum: z.date().nullish(),
  verbrauch_1: z.number().int().nullish(),
  verbrauch_2: z.number().int().nullish(),
  verbrauch_3: z.number().int().nullish(),
  verbrauch_4: z.number().int().nullish(),
  verbrauch_5: z.number().int().nullish(),
  verbrauch_6: z.number().int().nullish(),
  strom_1: z.number().int().nullish(),
  strom_2: z.number().int().nullish(),
  strom_3: z.number().int().nullish(),
  stromverbrauch_enthaelt_heizung: z.boolean().nullish(),
  stromverbrauch_enthaelt_warmwasser: z.boolean().nullish(),
  stromverbrauch_enthaelt_lueftung: z.boolean().nullish(),
  stromverbrauch_enthaelt_beleuchtung: z.boolean().nullish(),
  stromverbrauch_enthaelt_kuehlung: z.boolean().nullish(),
  stromverbrauch_enthaelt_sonstige: z.string().nullish(),
  kuehlung_enthalten: z.boolean().nullish(),
  anteil_kuehlung_1: z.number().nullish(),
  anteil_kuehlung_2: z.number().nullish(),
  wird_gekuehlt: z.boolean().nullish(),
  keller_beheizt: z.boolean().nullish(),
  alternative_heizung: z.boolean().nullish(),
  alternative_warmwasser: z.boolean().nullish(),
  alternative_lueftung: z.boolean().nullish(),
  alternative_kuehlung: z.boolean().nullish(),
  warmwasser_enthalten: z.boolean().nullish(),
  anteil_warmwasser_1: z.number().nullish(),
  anteil_warmwasser_2: z.number().nullish(),
  gebaeudeaufnahme_allgemein_id: z.number().int(),
})