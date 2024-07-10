import * as z from "zod"
import * as imports from "../../../prisma/null"
import { Bezahlmethoden, Rechnungsstatus, Service } from "@prisma/client"

export const RechnungenSchema = z.object({
  id: z.number().int(),
  uid: z.string(),
  benutzer_id: z.number().int(),
  empfaenger: z.string().nullish(),
  strasse: z.string().nullish(),
  plz: z.string().nullish(),
  ort: z.string().nullish(),
  zusatzzeile: z.string().nullish(),
  telefon: z.string().nullish(),
  email: z.string().nullish(),
  abweichende_versand_adresse: z.boolean().nullish(),
  versand_empfaenger: z.string().nullish(),
  versand_strasse: z.string().nullish(),
  versand_plz: z.string().nullish(),
  versand_ort: z.string().nullish(),
  versand_zusatzzeile: z.string().nullish(),
  bezahlmethode: z.nativeEnum(Bezahlmethoden),
  status: z.nativeEnum(Rechnungsstatus),
  services: z.nativeEnum(Service).array(),
  betrag: z.number(),
  erstellt_am: z.date(),
  bezahlt_am: z.date().nullish(),
  storniert_am: z.date().nullish(),
  transaktions_referenz: z.string().nullish(),
})
